require 'formular/element'
require 'formular/elements'
require 'formular/elements/modules/container'
require 'formular/elements/modules/wrapped_control'
require 'formular/elements/module'
require 'formular/elements/bootstrap3/input_groups'
require 'formular/elements/bootstrap3/checkable_controls'

module Formular
  module Elements
    module Bootstrap3
      include InputGroups
      include CheckableControls

      Label = Class.new(Formular::Elements::Label) { set_default :class, ['control-label'] }

      class Submit < Formular::Elements::Button
        tag 'button'
        set_default :class, ['btn', 'btn-default']
        set_default :type, 'submit'
      end # class Submit

      class Error < Formular::Elements::Error
        tag :span
        set_default :class, ['help-block']
      end # class Error

      class Hint < Formular::Elements::Hint
        tag :span
        set_default :class, ['help-block']
      end # class Hint

      class Input < Formular::Elements::Input
        include Formular::Elements::Modules::WrappedControl

        set_default :class, ['form-control'], unless: :file_input?

        def file_input?
          attributes[:type] == 'file'
        end
      end # class Input

      class Select < Formular::Elements::Select
        include Formular::Elements::Modules::WrappedControl

        set_default :class, ['form-control']
      end # class Select

      class Textarea < Formular::Elements::Textarea
        include Formular::Elements::Modules::WrappedControl
        set_default :class, ['form-control']
      end # class Textarea

      class Wrapper < Formular::Element
        include Formular::Elements::Modules::Container
        tag 'div'
        set_default :class, ['form-group']
      end # class Wrapper

      class ErrorWrapper < Formular::Elements::Bootstrap3::Wrapper
        tag 'div'
        set_default :class, ['form-group', 'has-error']
      end # class Wrapper
    end # module Bootstrap3
  end # module Elements
end # module Formular
