#include "include/camerax_linux/camera_x_linux_plugin.h"

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>

#define CAMERA_X_LINUX_PLUGIN(obj)                                             \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), camera_x_linux_plugin_get_type(),         \
                              CameraXLinuxPlugin))

struct _CameraXLinuxPlugin {
  GObject parent_instance;
};

G_DEFINE_TYPE(CameraXLinuxPlugin, camera_x_linux_plugin, g_object_get_type())

static void camera_x_linux_plugin_init(CameraXLinuxPlugin *self) {}

static void camera_x_linux_plugin_dispose(GObject *object) {
  G_OBJECT_CLASS(camera_x_linux_plugin_parent_class)->dispose(object);
}

static void camera_x_linux_plugin_class_init(CameraXLinuxPluginClass *klass) {
  G_OBJECT_CLASS(klass)->dispose = camera_x_linux_plugin_dispose;
}

void camera_x_linux_plugin_register_with_registrar(
    FlPluginRegistrar *registrar) {
  CameraXLinuxPlugin *plugin = CAMERA_X_LINUX_PLUGIN(
      g_object_new(camera_x_linux_plugin_get_type(), nullptr));

  g_object_unref(plugin);
}
