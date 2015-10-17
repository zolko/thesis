package hu.bme.thesis.dsl.viatra

import hu.bme.thesis.dsl.sensorDsl.MqttSetup
import hu.bme.thesis.dsl.sensorDsl.Sensor
import java.io.File
import java.io.FileWriter

class JavaGenerator {
	
	public static def generateJavaFiles(MqttSetup setup, Sensor sensor, String path) {
		createSubscribers(setup, sensor, path)
	}
	
	public static def generateGeneralSubscriber() {
		val subscriberFile = new File(System.getProperty("user.dir") + "\\generated\\Subscriber.java")
		if (subscriberFile != null && subscriberFile.exists) {
			subscriberFile.delete
		}
		subscriberFile.createNewFile
		val writer = new FileWriter(subscriberFile)
		val fileContent = '''
		import org.eclipse.paho.client.mqttv3.MqttCallback;
		import org.eclipse.paho.client.mqttv3.MqttClient;
		import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
		import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
		
		class Subscriber {
			
			private MqttClient client;
			private MqttConnectOptions connOpts;
			private MemoryPersistence persistance;
			
			public Subscriber(String brokerUrl, String clientId) {				
				persistance = new MemoryPersistence();
				client = new MqttClient(brokerUrl, clientId, persistance);
				connOpts = new MqttConnectOptions();
				connOpts.setCleanSession(true);
			}
			
			public void setCallback(MqttCallback callback) {
				client.setCallback(callback);
			}
			
			public void connect() {
				client.connect(connOpts);
			}
			
			public void subscribe(String topic) {
				client.subscribe(topic);
			}
			
			public void unsubscribe(String) {
				client.unsubscribe(topic);
			}
			
			public void disconnect() {
				client.disconnect();
			}
			
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createSubscribers(MqttSetup setup, Sensor sensor, String path) {
		//val subscriberFile = new File(System.getProperty("user.dir") + "\\resources\\" + sensor.name + "Receiver.java")
		val subscriberFile = new File(System.getProperty("user.dir") + "\\generated\\" + sensor.name.toFirstUpper + "Receiver.java")
		if (subscriberFile != null && subscriberFile.exists) {
			subscriberFile.delete
		}
		subscriberFile.createNewFile
		val writer = new FileWriter(subscriberFile)
		val fileContent = '''
		import de.undercouch.bson4jackson.BsonFactory;
		import hu.bme.thesis.model.ModelFactory;
		import org.eclipse.emf.common.util.URI;
		import org.eclipse.emf.ecore.resource.Resource;
		import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
		import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
		import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
		import org.eclipse.paho.client.mqttv3.MqttCallback;
		import org.eclipse.paho.client.mqttv3.MqttMessage;
		
		class �sensor.name�Receiver implements MqttCallback {
			
			private Subscriber subscriber;
			private BsonFactory factory;
			private Resource resource;
			
			public �sensor.name�Receiver() {
				factory = new BsonFactory();
				Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
				Map<String,Object> m = reg.getExtensionToFactoryMap();
		        m.put("model", new XMIResourceFactoryImpl());
		        ResourceSet resourceSet = new ResourceSetImpl();
		        resource = resourceSet.createResource(URI.createURI("model/thesis.model"));
				
				subscriber = new Subscriber("�setup.brokerUrl�", "�sensor.name.toUpperCase�_SUBSCRIBER");
				subscriber.setCallback(this);
			}
			
			public void connect() {
				subscriber.connect();
			}
			
			public void subscribe() {
				subscriber.subscribe(�sensor.name�);
			}
			
			public void unsubscribe() {
				subscriber.unsubscribe(�sensor.name�);
			}
			
			public void disconnect() {
				subscriber.disconnect();
			}
			
			@Override
			public void connectionLost(Throwable arg0) {
				throw new UnsupportedOperationException("Connection lost!");
			}
		
			@Override
			public void deliveryComplete(IMqttDeliveryToken arg0) {
				System.out.println("Delivery completed!");
			}
		
			@Override
			public void messageArrived(String topic, MqttMessage message) throws Exception {
				ByteArrayInputStream bais = new ByteArrayInputStream(message.getPayload());
				ObjectMapper mapper = new ObjectMapper(factory);
				Message message = (Message) resource.getContents().get(0);
				mapper.readValue(bais, Message.class);
				//TODO!
			}
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
}