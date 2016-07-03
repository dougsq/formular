require 'test_helper'
require "formular/elements"

describe Formular::Elements::Fieldset do
  describe "contents as string" do
    it "#to_s" do
      element = Formular::Elements::Fieldset.(content: "<legend>Hello</legend>")
      element.to_s.must_equal %(<fieldset><legend>Hello</legend></fieldset>)
    end
  end

  describe "contents as block" do
    it "#to_s" do
      element = Formular::Elements::Fieldset.() do |f, output|
        output.concat "<legend>Hello</legend>"
        output.concat Formular::Elements::Label.(class: ["control-label"], content: "A handy label").to_s
      end
      element.to_s.must_equal %(<fieldset><legend>Hello</legend><label class="control-label">A handy label</label></fieldset>)
    end
  end

  describe "no contents" do
    let(:element) { Formular::Elements::Fieldset.(class: ["grouping"]) }

    it "#to_s" do
      element.to_s.must_equal %(<fieldset class="grouping">)
    end

    it "#end" do
      element.end.must_equal %(</fieldset>)
    end
  end
end