require 'rails'

require 'rails_scaffold_templates_ui/helpers/badge_label_helper.rb'
require 'rails_scaffold_templates_ui/helpers/bootstrap_flash_helper.rb'
require 'rails_scaffold_templates_ui/helpers/flash_block_helper.rb'
require 'rails_scaffold_templates_ui/helpers/form_errors_helper.rb'
require 'rails_scaffold_templates_ui/helpers/glyph_helper.rb'
require 'rails_scaffold_templates_ui/helpers/message_helper.rb'
require 'rails_scaffold_templates_ui/helpers/modal_helper.rb'
require 'rails_scaffold_templates_ui/helpers/navbar_helper.rb'
require 'rails_scaffold_templates_ui/helpers/card_helper.rb'

module RailsScaffoldTemplatesUi
  class Engine < ::Rails::Engine
    initializer 'rails_scaffold_templates_ui.setup_helpers' do |app|
      [MessageHelper,
       CardHelper,
       FlashBlockHelper,
       BootstrapFlashHelper,
       ModalHelper,
       NavbarHelper,
       BadgeLabelHelper
      ].each do |h|
        app.config.to_prepare do
          ActionController::Base.send :helper, h
         end
       end
    end

    ActionView::Helpers::FormBuilder.send :include, FormErrorsHelper
  end
end
