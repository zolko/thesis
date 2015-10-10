/**
 */
package hu.bme.thesis.model;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Message</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link hu.bme.thesis.model.Message#getContents <em>Contents</em>}</li>
 * </ul>
 *
 * @see hu.bme.thesis.model.ModelPackage#getMessage()
 * @model
 * @generated
 */
public interface Message extends EObject {

	/**
	 * Returns the value of the '<em><b>Contents</b></em>' attribute list.
	 * The list contents are of type {@link java.lang.Object}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Contents</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Contents</em>' attribute list.
	 * @see hu.bme.thesis.model.ModelPackage#getMessage_Contents()
	 * @model required="true"
	 * @generated
	 */
	EList<Object> getContents();

} // Message
