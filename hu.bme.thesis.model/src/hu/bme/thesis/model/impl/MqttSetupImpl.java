/**
 */
package hu.bme.thesis.model.impl;

import hu.bme.thesis.model.ModelPackage;
import hu.bme.thesis.model.MqttSetup;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Mqtt Setup</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link hu.bme.thesis.model.impl.MqttSetupImpl#getBrokerUrl <em>Broker Url</em>}</li>
 * </ul>
 *
 * @generated
 */
public class MqttSetupImpl extends MinimalEObjectImpl.Container implements MqttSetup {
	/**
	 * The default value of the '{@link #getBrokerUrl() <em>Broker Url</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBrokerUrl()
	 * @generated
	 * @ordered
	 */
	protected static final String BROKER_URL_EDEFAULT = null;

	/**
	 * The cached value of the '{@link #getBrokerUrl() <em>Broker Url</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBrokerUrl()
	 * @generated
	 * @ordered
	 */
	protected String brokerUrl = BROKER_URL_EDEFAULT;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected MqttSetupImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ModelPackage.Literals.MQTT_SETUP;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String getBrokerUrl() {
		return brokerUrl;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBrokerUrl(String newBrokerUrl) {
		String oldBrokerUrl = brokerUrl;
		brokerUrl = newBrokerUrl;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ModelPackage.MQTT_SETUP__BROKER_URL, oldBrokerUrl, brokerUrl));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case ModelPackage.MQTT_SETUP__BROKER_URL:
				return getBrokerUrl();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case ModelPackage.MQTT_SETUP__BROKER_URL:
				setBrokerUrl((String)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case ModelPackage.MQTT_SETUP__BROKER_URL:
				setBrokerUrl(BROKER_URL_EDEFAULT);
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case ModelPackage.MQTT_SETUP__BROKER_URL:
				return BROKER_URL_EDEFAULT == null ? brokerUrl != null : !BROKER_URL_EDEFAULT.equals(brokerUrl);
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy()) return super.toString();

		StringBuffer result = new StringBuffer(super.toString());
		result.append(" (brokerUrl: ");
		result.append(brokerUrl);
		result.append(')');
		return result.toString();
	}

} //MqttSetupImpl
