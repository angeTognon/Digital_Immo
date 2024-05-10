//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <feda/feda_plugin_c_api.h>
#include <file_selector_windows/file_selector_windows.h>
#include <flash_api/flash_api_plugin_c_api.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FedaPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FedaPluginCApi"));
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  FlashApiPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlashApiPluginCApi"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
