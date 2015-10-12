/**
 */
package hu.bme.thesis.model;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Sensor</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link hu.bme.thesis.model.Sensor#getId <em>Id</em>}</li>
 *   <li>{@link hu.bme.thesis.model.Sensor#getMessages <em>Messages</em>}</li>
 *   <li>{@link hu.bme.thesis.model.Sensor#getSetup <em>Setup</em>}</li>
 * </ul>
 *
 * @see hu.bme.thesis.model.ModelPackage#getSensor()
 * @model
 * @generated
 */
public interface Sensor extends EObject {
	/**
	 * Returns the value of the '<em><b>Id</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Id</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Id</em>' attribute.
	 * @see #setId(String)
	 * @see hu.bme.thesis.model.ModelPackage#getSensor_Id()
	 * @model id="true" required="true"
	 * @generated
	 */
	String getId();

	/**
	 * Sets the value of the '{@link hu.bme.thesis.model.Sensor#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 * @generated
	 */
	void setId(String value);

	/**
	 * Returns the value of the '<em><b>Messages</b></em>' containment reference list.
	 * The list contents are of type {@link hu.bme.thesis.model.Message}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Messages</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Messages</em>' containment reference list.
	 * @see hu.bme.thesis.model.ModelPackage#getSensor_Messages()
	 * @model containment="true" required="true"
	 * @generated
	 */
	EList<Message> getMessages();

	/**
	 * Returns the value of the '<em><b>Setup</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Setup</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Setup</em>' reference.
	 * @see #setSetup(MqttSetup)
	 * @see hu.bme.thesis.model.ModelPackage#getSensor_Setup()
	 * @model required="true"
	 * @generated
	 */
	MqttSetup getSetup();

	/**
	 * Sets the value of the '{@link hu.bme.thesis.model.Sensor#getSetup <em>Setup</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Setup</em>' reference.
	 * @see #getSetup()
	 * @generated
	 */
	void setSetup(MqttSetup value);

} // Sensor
