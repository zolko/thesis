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
	int SENSOR = 5;

	/**
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.MessageImpl <em>Message</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.MessageImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMessage()
	 * @generated
	 */
	int MESSAGE = 2;

	/**
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.DataTypeImpl <em>Data Type</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.DataTypeImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getDataType()
	 * @generated
	 */
	int DATA_TYPE = 3;

	/**
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.MessageParameterImpl <em>Message Parameter</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.MessageParameterImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMessageParameter()
	 * @generated
	 */
	int MESSAGE_PARAMETER = 4;

	/**
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.MqttSetupImpl <em>Mqtt Setup</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.MqttSetupImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMqttSetup()
	 * @generated
	 */
	int MQTT_SETUP = 0;

	/**
	 * The feature id for the '<em><b>Broker Url</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MQTT_SETUP__BROKER_URL = 0;

	/**
	 * The number of structural features of the '<em>Mqtt Setup</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MQTT_SETUP_FEATURE_COUNT = 1;

	/**
	 * The number of operations of the '<em>Mqtt Setup</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MQTT_SETUP_OPERATION_COUNT = 0;


	/**
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.TypeImpl <em>Type</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.TypeImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getType()
	 * @generated
	 */
	int TYPE = 1;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TYPE__NAME = 0;

	/**
	 * The number of structural features of the '<em>Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TYPE_FEATURE_COUNT = 1;

	/**
	 * The number of operations of the '<em>Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TYPE_OPERATION_COUNT = 0;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE__NAME = TYPE__NAME;

	/**
	 * The feature id for the '<em><b>Parameters</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE__PARAMETERS = TYPE_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Qos</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE__QOS = TYPE_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>Message</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE_FEATURE_COUNT = TYPE_FEATURE_COUNT + 2;

	/**
	 * The number of operations of the '<em>Message</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE_OPERATION_COUNT = TYPE_OPERATION_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int DATA_TYPE__NAME = TYPE__NAME;

	/**
	 * The number of structural features of the '<em>Data Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int DATA_TYPE_FEATURE_COUNT = TYPE_FEATURE_COUNT + 0;

	/**
	 * The number of operations of the '<em>Data Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int DATA_TYPE_OPERATION_COUNT = TYPE_OPERATION_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Type</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE_PARAMETER__TYPE = 0;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE_PARAMETER__NAME = 1;

	/**
	 * The number of structural features of the '<em>Message Parameter</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE_PARAMETER_FEATURE_COUNT = 2;

	/**
	 * The number of operations of the '<em>Message Parameter</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE_PARAMETER_OPERATION_COUNT = 0;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR__NAME = 0;

	/**
	 * The feature id for the '<em><b>Messages</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR__MESSAGES = 1;

	/**
	 * The number of structural features of the '<em>Sensor</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR_FEATURE_COUNT = 2;

	/**
	 * The number of operations of the '<em>Sensor</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR_OPERATION_COUNT = 0;


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
	 * Returns the meta object for the attribute '{@link hu.bme.thesis.model.Sensor#getName <em>Name</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Name</em>'.
	 * @see hu.bme.thesis.model.Sensor#getName()
	 * @see #getSensor()
	 * @generated
	 */
	EAttribute getSensor_Name();

	/**
	 * Returns the meta object for the reference list '{@link hu.bme.thesis.model.Sensor#getMessages <em>Messages</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Messages</em>'.
	 * @see hu.bme.thesis.model.Sensor#getMessages()
	 * @see #getSensor()
	 * @generated
	 */
	EReference getSensor_Messages();

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
	 * Returns the meta object for the reference list '{@link hu.bme.thesis.model.Message#getParameters <em>Parameters</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Parameters</em>'.
	 * @see hu.bme.thesis.model.Message#getParameters()
	 * @see #getMessage()
	 * @generated
	 */
	EReference getMessage_Parameters();

	/**
	 * Returns the meta object for the attribute '{@link hu.bme.thesis.model.Message#getQos <em>Qos</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Qos</em>'.
	 * @see hu.bme.thesis.model.Message#getQos()
	 * @see #getMessage()
	 * @generated
	 */
	EAttribute getMessage_Qos();

	/**
	 * Returns the meta object for class '{@link hu.bme.thesis.model.DataType <em>Data Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Data Type</em>'.
	 * @see hu.bme.thesis.model.DataType
	 * @generated
	 */
	EClass getDataType();

	/**
	 * Returns the meta object for class '{@link hu.bme.thesis.model.MessageParameter <em>Message Parameter</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Message Parameter</em>'.
	 * @see hu.bme.thesis.model.MessageParameter
	 * @generated
	 */
	EClass getMessageParameter();

	/**
	 * Returns the meta object for the reference '{@link hu.bme.thesis.model.MessageParameter#getType <em>Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Type</em>'.
	 * @see hu.bme.thesis.model.MessageParameter#getType()
	 * @see #getMessageParameter()
	 * @generated
	 */
	EReference getMessageParameter_Type();

	/**
	 * Returns the meta object for the attribute '{@link hu.bme.thesis.model.MessageParameter#getName <em>Name</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Name</em>'.
	 * @see hu.bme.thesis.model.MessageParameter#getName()
	 * @see #getMessageParameter()
	 * @generated
	 */
	EAttribute getMessageParameter_Name();

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
	 * Returns the meta object for class '{@link hu.bme.thesis.model.Type <em>Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Type</em>'.
	 * @see hu.bme.thesis.model.Type
	 * @generated
	 */
	EClass getType();

	/**
	 * Returns the meta object for the attribute '{@link hu.bme.thesis.model.Type#getName <em>Name</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Name</em>'.
	 * @see hu.bme.thesis.model.Type#getName()
	 * @see #getType()
	 * @generated
	 */
	EAttribute getType_Name();

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
		 * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute SENSOR__NAME = eINSTANCE.getSensor_Name();

		/**
		 * The meta object literal for the '<em><b>Messages</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference SENSOR__MESSAGES = eINSTANCE.getSensor_Messages();

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
		 * The meta object literal for the '<em><b>Parameters</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference MESSAGE__PARAMETERS = eINSTANCE.getMessage_Parameters();

		/**
		 * The meta object literal for the '<em><b>Qos</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute MESSAGE__QOS = eINSTANCE.getMessage_Qos();

		/**
		 * The meta object literal for the '{@link hu.bme.thesis.model.impl.DataTypeImpl <em>Data Type</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see hu.bme.thesis.model.impl.DataTypeImpl
		 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getDataType()
		 * @generated
		 */
		EClass DATA_TYPE = eINSTANCE.getDataType();

		/**
		 * The meta object literal for the '{@link hu.bme.thesis.model.impl.MessageParameterImpl <em>Message Parameter</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see hu.bme.thesis.model.impl.MessageParameterImpl
		 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMessageParameter()
		 * @generated
		 */
		EClass MESSAGE_PARAMETER = eINSTANCE.getMessageParameter();

		/**
		 * The meta object literal for the '<em><b>Type</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference MESSAGE_PARAMETER__TYPE = eINSTANCE.getMessageParameter_Type();

		/**
		 * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute MESSAGE_PARAMETER__NAME = eINSTANCE.getMessageParameter_Name();

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
		 * The meta object literal for the '{@link hu.bme.thesis.model.impl.TypeImpl <em>Type</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see hu.bme.thesis.model.impl.TypeImpl
		 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getType()
		 * @generated
		 */
		EClass TYPE = eINSTANCE.getType();

		/**
		 * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute TYPE__NAME = eINSTANCE.getType_Name();

	}

} //ModelPackage
