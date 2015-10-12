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
 *   <li>{@link hu.bme.thesis.model.MqttSetup#getSubscriberId <em>Subscriber Id</em>}</li>
 *   <li>{@link hu.bme.thesis.model.MqttSetup#getQos <em>Qos</em>}</li>
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
	 * @model required="true"
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

	/**
	 * Returns the value of the '<em><b>Subscriber Id</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Subscriber Id</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Subscriber Id</em>' attribute.
	 * @see #setSubscriberId(String)
	 * @see hu.bme.thesis.model.ModelPackage#getMqttSetup_SubscriberId()
	 * @model required="true"
	 * @generated
	 */
	String getSubscriberId();

	/**
	 * Sets the value of the '{@link hu.bme.thesis.model.MqttSetup#getSubscriberId <em>Subscriber Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Subscriber Id</em>' attribute.
	 * @see #getSubscriberId()
	 * @generated
	 */
	void setSubscriberId(String value);

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
	 * @see hu.bme.thesis.model.ModelPackage#getMqttSetup_Qos()
	 * @model required="true"
	 * @generated
	 */
	int getQos();

	/**
	 * Sets the value of the '{@link hu.bme.thesis.model.MqttSetup#getQos <em>Qos</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qos</em>' attribute.
	 * @see #getQos()
	 * @generated
	 */
	void setQos(int value);

} // MqttSetup
