/**
 */
package hu.bme.thesis.model;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Message</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link hu.bme.thesis.model.Message#getParameters <em>Parameters</em>}</li>
 *   <li>{@link hu.bme.thesis.model.Message#getQos <em>Qos</em>}</li>
 * </ul>
 *
 * @see hu.bme.thesis.model.ModelPackage#getMessage()
 * @model
 * @generated
 */
public interface Message extends Type {

	/**
	 * Returns the value of the '<em><b>Parameters</b></em>' reference list.
	 * The list contents are of type {@link hu.bme.thesis.model.MessageParameter}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Parameters</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Parameters</em>' reference list.
	 * @see hu.bme.thesis.model.ModelPackage#getMessage_Parameters()
	 * @model
	 * @generated
	 */
	EList<MessageParameter> getParameters();

	/**
	 * Returns the value of the '<em><b>Qos</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Qos</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Qos</em>' attribute.
	 * @see #setQos(int)
	 * @see hu.bme.thesis.model.ModelPackage#getMessage_Qos()
	 * @model
	 * @generated
	 */
	int getQos();

	/**
	 * Sets the value of the '{@link hu.bme.thesis.model.Message#getQos <em>Qos</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qos</em>' attribute.
	 * @see #getQos()
	 * @generated
	 */
	void setQos(int value);

} // Message
