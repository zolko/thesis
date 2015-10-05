/**
 */
package hu.bme.thesis.model;

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
 *   <li>{@link hu.bme.thesis.model.Sensor#getMessage <em>Message</em>}</li>
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
	 * Returns the value of the '<em><b>Message</b></em>' containment reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Message</em>' containment reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Message</em>' containment reference.
	 * @see #setMessage(Message)
	 * @see hu.bme.thesis.model.ModelPackage#getSensor_Message()
	 * @model containment="true" required="true"
	 * @generated
	 */
	Message getMessage();

	/**
	 * Sets the value of the '{@link hu.bme.thesis.model.Sensor#getMessage <em>Message</em>}' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Message</em>' containment reference.
	 * @see #getMessage()
	 * @generated
	 */
	void setMessage(Message value);

} // Sensor
