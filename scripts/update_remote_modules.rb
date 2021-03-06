#!/bin/env ruby
require_relative '../lib/module_updater'

if ENV.has_key?('MODULE_UPDATER_PARTIAL')
  changed_modules = *ModuleUpdater.update_partial_remote_modules
  if changed_modules.size > 0
    puts ">> Updated #{changed_modules.size} modules:"
    puts changed_modules.join(', ')
  end
else
  changed_modules, removed_modules = *ModuleUpdater.update_remote_modules
  if changed_modules.size > 0
    puts ">> Updated #{changed_modules.size} modules:"
    puts changed_modules.keys.join(', ')
  end

  if removed_modules.size > 0
    puts ">> Removed #{removed_modules.size} modules:"
    puts removed_modules.join(', ')
  end
end
