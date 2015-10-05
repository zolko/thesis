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
	 * The feature id for the '<em><b>Message</b></em>' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SENSOR__MESSAGE = 1;

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
	 * The meta object id for the '{@link hu.bme.thesis.model.impl.MessageImpl <em>Message</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see hu.bme.thesis.model.impl.MessageImpl
	 * @see hu.bme.thesis.model.impl.ModelPackageImpl#getMessage()
	 * @generated
	 */
	int MESSAGE = 1;

	/**
	 * The feature id for the '<em><b>Content</b></em>' attribute list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int MESSAGE__CONTENT = 0;

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
	 * Returns the meta object for the containment reference '{@link hu.bme.thesis.model.Sensor#getMessage <em>Message</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference '<em>Message</em>'.
	 * @see hu.bme.thesis.model.Sensor#getMessage()
	 * @see #getSensor()
	 * @generated
	 */
	EReference getSensor_Message();

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
	 * Returns the meta object for the attribute list '{@link hu.bme.thesis.model.Message#getContent <em>Content</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute list '<em>Content</em>'.
	 * @see hu.bme.thesis.model.Message#getContent()
	 * @see #getMessage()
	 * @generated
	 */
	EAttribute getMessage_Content();

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
		 * The meta object literal for the '<em><b>Message</b></em>' containment reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference SENSOR__MESSAGE = eINSTANCE.getSensor_Message();

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
		 * The meta object literal for the '<em><b>Content</b></em>' attribute list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute MESSAGE__CONTENT = eINSTANCE.getMessage_Content();

	}

} //ModelPackage
