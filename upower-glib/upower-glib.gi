<?xml version="1.0"?>
<api version="1.0">
	<namespace name="UP">
		<enum name="UpDeviceKind">
			<member name="DEVICE_KIND_UNKNOWN" value="0"/>
			<member name="DEVICE_KIND_LINE_POWER" value="1"/>
			<member name="DEVICE_KIND_BATTERY" value="2"/>
			<member name="DEVICE_KIND_UPS" value="3"/>
			<member name="DEVICE_KIND_MONITOR" value="4"/>
			<member name="DEVICE_KIND_MOUSE" value="5"/>
			<member name="DEVICE_KIND_KEYBOARD" value="6"/>
			<member name="DEVICE_KIND_PDA" value="7"/>
			<member name="DEVICE_KIND_PHONE" value="8"/>
			<member name="DEVICE_KIND_MEDIA_PLAYER" value="9"/>
			<member name="DEVICE_KIND_TABLET" value="10"/>
			<member name="DEVICE_KIND_COMPUTER" value="11"/>
			<member name="DEVICE_KIND_GAMING_INPUT" value="12"/>
			<member name="DEVICE_KIND_PEN" value="13"/>
			<member name="DEVICE_KIND_TOUCHPAD" value="14"/>
			<member name="DEVICE_KIND_MODEM" value="15"/>
			<member name="DEVICE_KIND_NETWORK" value="16"/>
			<member name="DEVICE_KIND_HEADSET" value="17"/>
			<member name="DEVICE_KIND_SPEAKERS" value="18"/>
			<member name="DEVICE_KIND_HEADPHONES" value="19"/>
			<member name="DEVICE_KIND_VIDEO" value="20"/>
			<member name="DEVICE_KIND_OTHER_AUDIO" value="21"/>
			<member name="DEVICE_KIND_REMOTE_CONTROL" value="22"/>
			<member name="DEVICE_KIND_PRINTER" value="23"/>
			<member name="DEVICE_KIND_SCANNER" value="24"/>
			<member name="DEVICE_KIND_CAMERA" value="25"/>
			<member name="DEVICE_KIND_WEARABLE" value="26"/>
			<member name="DEVICE_KIND_TOY" value="27"/>
			<member name="DEVICE_KIND_BLUETOOTH_GENERIC" value="28"/>
			<member name="DEVICE_KIND_LAST" value="29"/>
		</enum>
		<enum name="UpDeviceLevel">
			<member name="DEVICE_LEVEL_UNKNOWN" value="0"/>
			<member name="DEVICE_LEVEL_NONE" value="1"/>
			<member name="DEVICE_LEVEL_DISCHARGING" value="2"/>
			<member name="DEVICE_LEVEL_LOW" value="3"/>
			<member name="DEVICE_LEVEL_CRITICAL" value="4"/>
			<member name="DEVICE_LEVEL_ACTION" value="5"/>
			<member name="DEVICE_LEVEL_NORMAL" value="6"/>
			<member name="DEVICE_LEVEL_HIGH" value="7"/>
			<member name="DEVICE_LEVEL_FULL" value="8"/>
			<member name="DEVICE_LEVEL_LAST" value="9"/>
		</enum>
		<enum name="UpDeviceState">
			<member name="DEVICE_STATE_UNKNOWN" value="0"/>
			<member name="DEVICE_STATE_CHARGING" value="1"/>
			<member name="DEVICE_STATE_DISCHARGING" value="2"/>
			<member name="DEVICE_STATE_EMPTY" value="3"/>
			<member name="DEVICE_STATE_FULLY_CHARGED" value="4"/>
			<member name="DEVICE_STATE_PENDING_CHARGE" value="5"/>
			<member name="DEVICE_STATE_PENDING_DISCHARGE" value="6"/>
			<member name="DEVICE_STATE_LAST" value="7"/>
		</enum>
		<enum name="UpDeviceTechnology">
			<member name="DEVICE_TECHNOLOGY_UNKNOWN" value="0"/>
			<member name="DEVICE_TECHNOLOGY_LITHIUM_ION" value="1"/>
			<member name="DEVICE_TECHNOLOGY_LITHIUM_POLYMER" value="2"/>
			<member name="DEVICE_TECHNOLOGY_LITHIUM_IRON_PHOSPHATE" value="3"/>
			<member name="DEVICE_TECHNOLOGY_LEAD_ACID" value="4"/>
			<member name="DEVICE_TECHNOLOGY_NICKEL_CADMIUM" value="5"/>
			<member name="DEVICE_TECHNOLOGY_NICKEL_METAL_HYDRIDE" value="6"/>
			<member name="DEVICE_TECHNOLOGY_LAST" value="7"/>
		</enum>
		<object name="UpClient" parent="GObject" type-name="UpClient" get-type="up_client_get_type">
			<!-- <implements> -->
				<!-- <interface name="GInitable"/> -->
			<!-- </implements> -->
			<method name="get_critical_action" symbol="up_client_get_critical_action">
				<return-type type="char*"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
				</parameters>
			</method>
			<method name="get_daemon_version" symbol="up_client_get_daemon_version">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
				</parameters>
			</method>
			<method name="get_devices" symbol="up_client_get_devices">
				<return-type type="GPtrArray*"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
				</parameters>
			</method>
			<method name="get_devices2" symbol="up_client_get_devices2">
				<return-type type="GPtrArray*"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
				</parameters>
			</method>
			<method name="get_display_device" symbol="up_client_get_display_device">
				<return-type type="UpDevice*"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
				</parameters>
			</method>
			<method name="get_lid_is_closed" symbol="up_client_get_lid_is_closed">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
				</parameters>
			</method>
			<method name="get_lid_is_present" symbol="up_client_get_lid_is_present">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
				</parameters>
			</method>
			<method name="get_on_battery" symbol="up_client_get_on_battery">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="up_client_new">
				<return-type type="UpClient*"/>
			</constructor>
			<constructor name="new_full" symbol="up_client_new_full">
				<return-type type="UpClient*"/>
				<parameters>
					<!-- <parameter name="cancellable" type="GCancellable*"/> -->
					<parameter name="error" type="GError**"/>
				</parameters>
			</constructor>
			<property name="daemon-version" type="char*" readable="1" writable="0" construct="0" construct-only="0"/>
			<property name="lid-is-closed" type="gboolean" readable="1" writable="0" construct="0" construct-only="0"/>
			<property name="lid-is-present" type="gboolean" readable="1" writable="0" construct="0" construct-only="0"/>
			<property name="on-battery" type="gboolean" readable="1" writable="0" construct="0" construct-only="0"/>
			<signal name="device-added" when="LAST">
				<return-type type="void"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
					<parameter name="device" type="UpDevice*"/>
				</parameters>
			</signal>
			<signal name="device-removed" when="LAST">
				<return-type type="void"/>
				<parameters>
					<parameter name="client" type="UpClient*"/>
					<parameter name="object_path" type="char*"/>
				</parameters>
			</signal>
		</object>
		<object name="UpDevice" parent="GObject" type-name="UpDevice" get-type="up_device_get_type">
			<method name="get_history_sync" symbol="up_device_get_history_sync">
				<return-type type="GPtrArray*"/>
				<parameters>
					<parameter name="device" type="UpDevice*"/>
					<parameter name="type" type="gchar*"/>
					<parameter name="timespec" type="guint"/>
					<parameter name="resolution" type="guint"/>
					<!-- <parameter name="cancellable" type="GCancellable*"/> -->
					<parameter name="error" type="GError**"/>
				</parameters>
			</method>
			<method name="get_object_path" symbol="up_device_get_object_path">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="device" type="UpDevice*"/>
				</parameters>
			</method>
			<method name="get_statistics_sync" symbol="up_device_get_statistics_sync">
				<return-type type="GPtrArray*"/>
				<parameters>
					<parameter name="device" type="UpDevice*"/>
					<parameter name="type" type="gchar*"/>
					<!-- <parameter name="cancellable" type="GCancellable*"/> -->
					<parameter name="error" type="GError**"/>
				</parameters>
			</method>
			<method name="kind_from_string" symbol="up_device_kind_from_string">
				<return-type type="UpDeviceKind"/>
				<parameters>
					<parameter name="type" type="gchar*"/>
				</parameters>
			</method>
			<method name="kind_to_string" symbol="up_device_kind_to_string">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="type_enum" type="UpDeviceKind"/>
				</parameters>
			</method>
			<method name="level_from_string" symbol="up_device_level_from_string">
				<return-type type="UpDeviceLevel"/>
				<parameters>
					<parameter name="level" type="gchar*"/>
				</parameters>
			</method>
			<method name="level_to_string" symbol="up_device_level_to_string">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="level_enum" type="UpDeviceLevel"/>
				</parameters>
			</method>
			<constructor name="new" symbol="up_device_new">
				<return-type type="UpDevice*"/>
			</constructor>
			<method name="refresh_sync" symbol="up_device_refresh_sync">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="device" type="UpDevice*"/>
					<!-- <parameter name="cancellable" type="GCancellable*"/> -->
					<parameter name="error" type="GError**"/>
				</parameters>
			</method>
			<method name="set_object_path_sync" symbol="up_device_set_object_path_sync">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="device" type="UpDevice*"/>
					<parameter name="object_path" type="gchar*"/>
					<!-- <parameter name="cancellable" type="GCancellable*"/> -->
					<parameter name="error" type="GError**"/>
				</parameters>
			</method>
			<method name="state_from_string" symbol="up_device_state_from_string">
				<return-type type="UpDeviceState"/>
				<parameters>
					<parameter name="state" type="gchar*"/>
				</parameters>
			</method>
			<method name="state_to_string" symbol="up_device_state_to_string">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="state_enum" type="UpDeviceState"/>
				</parameters>
			</method>
			<method name="technology_from_string" symbol="up_device_technology_from_string">
				<return-type type="UpDeviceTechnology"/>
				<parameters>
					<parameter name="technology" type="gchar*"/>
				</parameters>
			</method>
			<method name="technology_to_string" symbol="up_device_technology_to_string">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="technology_enum" type="UpDeviceTechnology"/>
				</parameters>
			</method>
			<method name="to_text" symbol="up_device_to_text">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="device" type="UpDevice*"/>
				</parameters>
			</method>
			<property name="battery-level" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="capacity" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="energy" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="energy-empty" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="energy-full" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="energy-full-design" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="energy-rate" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="has-history" type="gboolean" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="has-statistics" type="gboolean" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="icon-name" type="char*" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="is-present" type="gboolean" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="is-rechargeable" type="gboolean" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="kind" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="luminosity" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="model" type="char*" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="native-path" type="char*" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="online" type="gboolean" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="percentage" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="power-supply" type="gboolean" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="serial" type="char*" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="state" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="technology" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="temperature" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="time-to-empty" type="gint64" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="time-to-full" type="gint64" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="update-time" type="guint64" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="vendor" type="char*" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="voltage" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="warning-level" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
		</object>
		<object name="UpHistoryItem" parent="GObject" type-name="UpHistoryItem" get-type="up_history_item_get_type">
			<method name="get_state" symbol="up_history_item_get_state">
				<return-type type="UpDeviceState"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
				</parameters>
			</method>
			<method name="get_time" symbol="up_history_item_get_time">
				<return-type type="guint"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
				</parameters>
			</method>
			<method name="get_value" symbol="up_history_item_get_value">
				<return-type type="gdouble"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="up_history_item_new">
				<return-type type="UpHistoryItem*"/>
			</constructor>
			<method name="set_from_string" symbol="up_history_item_set_from_string">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
					<parameter name="text" type="gchar*"/>
				</parameters>
			</method>
			<method name="set_state" symbol="up_history_item_set_state">
				<return-type type="void"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
					<parameter name="state" type="UpDeviceState"/>
				</parameters>
			</method>
			<method name="set_time" symbol="up_history_item_set_time">
				<return-type type="void"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
					<parameter name="time" type="guint"/>
				</parameters>
			</method>
			<method name="set_time_to_present" symbol="up_history_item_set_time_to_present">
				<return-type type="void"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
				</parameters>
			</method>
			<method name="set_value" symbol="up_history_item_set_value">
				<return-type type="void"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
					<parameter name="value" type="gdouble"/>
				</parameters>
			</method>
			<method name="to_string" symbol="up_history_item_to_string">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="history_item" type="UpHistoryItem*"/>
				</parameters>
			</method>
			<property name="state" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="time" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="value" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
		</object>
		<object name="UpStatsItem" parent="GObject" type-name="UpStatsItem" get-type="up_stats_item_get_type">
			<method name="get_accuracy" symbol="up_stats_item_get_accuracy">
				<return-type type="gdouble"/>
				<parameters>
					<parameter name="stats_item" type="UpStatsItem*"/>
				</parameters>
			</method>
			<method name="get_value" symbol="up_stats_item_get_value">
				<return-type type="gdouble"/>
				<parameters>
					<parameter name="stats_item" type="UpStatsItem*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="up_stats_item_new">
				<return-type type="UpStatsItem*"/>
			</constructor>
			<method name="set_accuracy" symbol="up_stats_item_set_accuracy">
				<return-type type="void"/>
				<parameters>
					<parameter name="stats_item" type="UpStatsItem*"/>
					<parameter name="accuracy" type="gdouble"/>
				</parameters>
			</method>
			<method name="set_value" symbol="up_stats_item_set_value">
				<return-type type="void"/>
				<parameters>
					<parameter name="stats_item" type="UpStatsItem*"/>
					<parameter name="value" type="gdouble"/>
				</parameters>
			</method>
			<property name="accuracy" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="value" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
		</object>
		<object name="UpWakeupItem" parent="GObject" type-name="UpWakeupItem" get-type="up_wakeup_item_get_type">
			<method name="get_cmdline" symbol="up_wakeup_item_get_cmdline">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
				</parameters>
			</method>
			<method name="get_details" symbol="up_wakeup_item_get_details">
				<return-type type="gchar*"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
				</parameters>
			</method>
			<method name="get_id" symbol="up_wakeup_item_get_id">
				<return-type type="guint"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
				</parameters>
			</method>
			<method name="get_is_userspace" symbol="up_wakeup_item_get_is_userspace">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
				</parameters>
			</method>
			<method name="get_old" symbol="up_wakeup_item_get_old">
				<return-type type="guint"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
				</parameters>
			</method>
			<method name="get_value" symbol="up_wakeup_item_get_value">
				<return-type type="gdouble"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="up_wakeup_item_new">
				<return-type type="UpWakeupItem*"/>
			</constructor>
			<method name="set_cmdline" symbol="up_wakeup_item_set_cmdline">
				<return-type type="void"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
					<parameter name="cmdline" type="gchar*"/>
				</parameters>
			</method>
			<method name="set_details" symbol="up_wakeup_item_set_details">
				<return-type type="void"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
					<parameter name="details" type="gchar*"/>
				</parameters>
			</method>
			<method name="set_id" symbol="up_wakeup_item_set_id">
				<return-type type="void"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
					<parameter name="id" type="guint"/>
				</parameters>
			</method>
			<method name="set_is_userspace" symbol="up_wakeup_item_set_is_userspace">
				<return-type type="void"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
					<parameter name="is_userspace" type="gboolean"/>
				</parameters>
			</method>
			<method name="set_old" symbol="up_wakeup_item_set_old">
				<return-type type="void"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
					<parameter name="old" type="guint"/>
				</parameters>
			</method>
			<method name="set_value" symbol="up_wakeup_item_set_value">
				<return-type type="void"/>
				<parameters>
					<parameter name="wakeup_item" type="UpWakeupItem*"/>
					<parameter name="value" type="gdouble"/>
				</parameters>
			</method>
			<property name="cmdline" type="char*" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="details" type="char*" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="id" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="is-userspace" type="gboolean" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="old" type="guint" readable="1" writable="1" construct="0" construct-only="0"/>
			<property name="value" type="gdouble" readable="1" writable="1" construct="0" construct-only="0"/>
		</object>
		<object name="UpWakeups" parent="GObject" type-name="UpWakeups" get-type="up_wakeups_get_type">
			<method name="get_data_sync" symbol="up_wakeups_get_data_sync">
				<return-type type="GPtrArray*"/>
				<parameters>
					<parameter name="wakeups" type="UpWakeups*"/>
					<!-- <parameter name="cancellable" type="GCancellable*"/> -->
					<parameter name="error" type="GError**"/>
				</parameters>
			</method>
			<method name="get_has_capability" symbol="up_wakeups_get_has_capability">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="wakeups" type="UpWakeups*"/>
				</parameters>
			</method>
			<method name="get_properties_sync" symbol="up_wakeups_get_properties_sync">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="wakeups" type="UpWakeups*"/>
					<!-- <parameter name="cancellable" type="GCancellable*"/> -->
					<parameter name="error" type="GError**"/>
				</parameters>
			</method>
			<method name="get_total_sync" symbol="up_wakeups_get_total_sync">
				<return-type type="guint"/>
				<parameters>
					<parameter name="wakeups" type="UpWakeups*"/>
					<!-- <parameter name="cancellable" type="GCancellable*"/> -->
					<parameter name="error" type="GError**"/>
				</parameters>
			</method>
			<constructor name="new" symbol="up_wakeups_new">
				<return-type type="UpWakeups*"/>
			</constructor>
			<signal name="data-changed" when="LAST">
				<return-type type="void"/>
				<parameters>
					<parameter name="wakeups" type="UpWakeups*"/>
				</parameters>
			</signal>
			<signal name="total-changed" when="LAST">
				<return-type type="void"/>
				<parameters>
					<parameter name="wakeups" type="UpWakeups*"/>
					<parameter name="value" type="guint"/>
				</parameters>
			</signal>
		</object>
		<constant name="MAJOR_VERSION" type="int" value="0"/>
		<constant name="MICRO_VERSION" type="int" value="13"/>
		<constant name="MINOR_VERSION" type="int" value="99"/>
	</namespace>
</api>
