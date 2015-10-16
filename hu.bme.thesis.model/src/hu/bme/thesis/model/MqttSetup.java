/**
 */
package hu.bme.thesis.model;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Mqtt Setup</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link hu.bme.thesis.model.MqttSetup#getBrokerUrl <em>Broker Url</em>}</li>
 * </ul>
 *
 * @see hu.bme.thesis.model.ModelPackage#getMqttSetup()
 * @model
 * @generated
 */
public interface MqttSetup extends EObject {
	/**
	 * Returns the value of the '<em><b>Broker Url</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Broker Url</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Broker Url</em>' attribute.
	 * @see #setBrokerUrl(String)
	 * @see hu.bme.thesis.model.ModelPackage#getMqttSetup_BrokerUrl()
	 * @model
	 * @generated
	 */
	String getBrokerUrl();

	/**
	 * Sets the value of the '{@link hu.bme.thesis.model.MqttSetup#getBrokerUrl <em>Broker Url</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Broker Url</em>' attribute.
	 * @see #getBrokerUrl()
	 * @generated
	 */
	void setBrokerUrl(String value);

} // MqttSetup
