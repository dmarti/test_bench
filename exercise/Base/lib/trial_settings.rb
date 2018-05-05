require 'yaml'

class TrialSettings
  class << self
    def method_missing(m)
      settings[m.to_sym]
    end

    def settings
      base_settings = {
        trial_dir: TRIAL_DIR,
      }
      @settings ||= base_settings.merge(yaml_settings)
    end

    def settings_file
      File.expand_path("./.trial_data/Settings.yml", TRIAL_DIR)
    end

    private

    def yaml_settings
       YAML.load_file(settings_file).transform_keys {|k| k.to_sym}
    end
  end
end

TS = TrialSettings
