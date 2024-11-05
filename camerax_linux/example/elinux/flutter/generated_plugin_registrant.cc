//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <camerax_linux/camera_x_linux_plugin.h>
#include <hybrid_v4l2/hybrid_v4l2_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  CameraXLinuxPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CameraXLinuxPlugin"));
  HybridV4l2PluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("HybridV4l2Plugin"));
}
