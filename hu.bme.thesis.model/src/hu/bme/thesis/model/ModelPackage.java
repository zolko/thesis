/**
 */
package hu.bme.thesis.model;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each operation of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @see hu.bme.thesis.model.ModelFactory
 * @model kind="package"
 * @generated
 */
public interface ModelPackage extends EPackage {
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "model";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "model.meta";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "hu.bme.thesis.model";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	ModelPackage eINSTANCE = hu.bme.thesis.model.impl.ModelPackageImpl.init();

	/**
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.SensorImpl <em>Sensor</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.SensorImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getSensor()
	 * @generated
	 */
	int SENSOR = 0;

	/**
	 * The feature id for the '<em><b>Id</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR__ID = 0;

	/**
	 * The feature id for the '<em><b>Messages</b></em>' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR__MESSAGES = 1;

	/**
	 * The feature id for the '<em><b>Setup</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR__SETUP = 2;

	/**
	 * The number of structural features of the '<em>Sensor</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR_FEATURE_COUNT = 3;

	/**
	 * The number of operations of the '<em>Sensor</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.MessageImpl <em>Message</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.MessageImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMessage()
	 * @generated
	 */
	int MESSAGE = 1;

	/**
	 * The feature id for the '<em><b>Contents</b></em>' attribute list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE__CONTENTS = 0;

	/**
	 * The number of structural features of the '<em>Message</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE_FEATURE_COUNT = 1;

	/**
	 * The number of operations of the '<em>Message</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE_OPERATION_COUNT = 0;


	/**
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.MqttSetupImpl <em>Mqtt Setup</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.MqttSetupImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMqttSetup()
	 * @generated
	 */
	int MQTT_SETUP = 2;

	/**
	 * The feature id for the '<em><b>Broker Url</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MQTT_SETUP__BROKER_URL = 0;

	/**
	 * The feature id for the '<em><b>Subscriber Id</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MQTT_SETUP__SUBSCRIBER_ID = 1;

	/**
	 * The feature id for the '<em><b>Qos</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MQTT_SETUP__QOS = 2;

	/**
	 * The number of structural features of the '<em>Mqtt Setup</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MQTT_SETUP_FEATURE_COUNT = 3;

	/**
	 * The number of operations of the '<em>Mqtt Setup</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MQTT_SETUP_OPERATION_COUNT = 0;


	/**
	 * Returns the meta object for class '{@link hu.bme.thesis.model.Sensor <em>Sensor</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Sensor</em>'.
	 * @see hu.bme.thesis.model.Sensor
	 * @generated
	 */
	EClass getSensor();

	/**
	 * Returns the meta object for the attribute '{@link hu.bme.thesis.model.Sensor#getId <em>Id</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Id</em>'.
	 * @see hu.bme.thesis.model.Sensor#getId()
	 * @see #getSensor()
	 * @generated
	 */
	EAttribute getSensor_Id();

	/**
	 * Returns the meta object for the containment reference list '{@link hu.bme.thesis.model.Sensor#getMessages <em>Messages</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference list '<em>Messages</em>'.
	 * @see hu.bme.thesis.model.Sensor#getMessages()
	 * @see #getSensor()
	 * @generated
	 */
	EReference getSensor_Messages();

	/**
	 * Returns the meta object for the reference '{@link hu.bme.thesis.model.Sensor#getSetup <em>Setup</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Setup</em>'.
	 * @see hu.bme.thesis.model.Sensor#getSetup()
	 * @see #getSensor()
	 * @generated
	 */
	EReference getSensor_Setup();

	/**
	 * Returns the meta object for class '{@link hu.bme.thesis.model.Message <em>Message</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Message</em>'.
	 * @see hu.bme.thesis.model.Message
	 * @generated
	 */
	EClass getMessage();

	/**
	 * Returns the meta object for the attribute list '{@link hu.bme.thesis.model.Message#getContents <em>Contents</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute list '<em>Contents</em>'.
	 * @see hu.bme.thesis.model.Message#getContents()
	 * @see #getMessage()
	 * @generated
	 */
	EAttribute getMessage_Contents();

	/**
	 * Returns the meta object for class '{@link hu.bme.thesis.model.MqttSetup <em>Mqtt Setup</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Mqtt Setup</em>'.
	 * @see hu.bme.thesis.model.MqttSetup
	 * @generated
	 */
	EClass getMqttSetup();

	/**
	 * Returns the meta object for the attribute '{@link hu.bme.thesis.model.MqttSetup#getBrokerUrl <em>Broker Url</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Broker Url</em>'.
	 * @see hu.bme.thesis.model.MqttSetup#getBrokerUrl()
	 * @see #getMqttSetup()
	 * @generated
	 */
	EAttribute getMqttSetup_BrokerUrl();

	/**
	 * Returns the meta object for the attribute '{@link hu.bme.thesis.model.MqttSetup#getSubscriberId <em>Subscriber Id</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Subscriber Id</em>'.
	 * @see hu.bme.thesis.model.MqttSetup#getSubscriberId()
	 * @see #getMqttSetup()
	 * @generated
	 */
	EAttribute getMqttSetup_SubscriberId();

	/**
	 * Returns the meta object for the attribute '{@link hu.bme.thesis.model.MqttSetup#getQos <em>Qos</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Qos</em>'.
	 * @see hu.bme.thesis.model.MqttSetup#getQos()
	 * @see #getMqttSetup()
	 * @generated
	 */
	EAttribute getMqttSetup_Qos();

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	ModelFactory getModelFactory();

	/**
	 * <!-- begin-user-doc -->
	 * Defines literals for the meta objects that represent
	 * <ul>
	 *   <li>each class,</li>
	 *   <li>each feature of each class,</li>
	 *   <li>each operation of each class,</li>
	 *   <li>each enum,</li>
	 *   <li>and each data type</li>
	 * </ul>
	 * <!-- end-user-doc -->
	 * @generated
	 */
	interface Literals {
		/**
		 * The meta object literal for the '{@link hu.bme.thesis.model.impl.SensorImpl <em>Sensor</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see hu.bme.thesis.model.impl.SensorImpl
		 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getSensor()
		 * @generated
		 */
		EClass SENSOR = eINSTANCE.getSensor();

		/**
		 * The meta object literal for the '<em><b>Id</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute SENSOR__ID = eINSTANCE.getSensor_Id();

		/**
		 * The meta object literal for the '<em><b>Messages</b></em>' containment reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference SENSOR__MESSAGES = eINSTANCE.getSensor_Messages();

		/**
		 * The meta object literal for the '<em><b>Setup</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference SENSOR__SETUP = eINSTANCE.getSensor_Setup();

		/**
		 * The meta object literal for the '{@link hu.bme.thesis.model.impl.MessageImpl <em>Message</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see hu.bme.thesis.model.impl.MessageImpl
		 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMessage()
		 * @generated
		 */
		EClass MESSAGE = eINSTANCE.getMessage();

		/**
		 * The meta object literal for the '<em><b>Contents</b></em>' attribute list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute MESSAGE__CONTENTS = eINSTANCE.getMessage_Contents();

		/**
		 * The meta object literal for the '{@link hu.bme.thesis.model.impl.MqttSetupImpl <em>Mqtt Setup</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see hu.bme.thesis.model.impl.MqttSetupImpl
		 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMqttSetup()
		 * @generated
		 */
		EClass MQTT_SETUP = eINSTANCE.getMqttSetup();

		/**
		 * The meta object literal for the '<em><b>Broker Url</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute MQTT_SETUP__BROKER_URL = eINSTANCE.getMqttSetup_BrokerUrl();

		/**
		 * The meta object literal for the '<em><b>Subscriber Id</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute MQTT_SETUP__SUBSCRIBER_ID = eINSTANCE.getMqttSetup_SubscriberId();

		/**
		 * The meta object literal for the '<em><b>Qos</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute MQTT_SETUP__QOS = eINSTANCE.getMqttSetup_Qos();

	}

} //ModelPackage
