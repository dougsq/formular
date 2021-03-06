require 'test_helper'
require 'formular/builders/foundation6'
require 'formular/elements/foundation6'

describe Formular::Elements::Foundation6 do
  let(:builder) { Formular::Builders::Foundation6.new }
  let(:collection_array) { [[1, 'Option 1'], [2, 'Option 2']] }

  describe Formular::Elements::Foundation6::Input do
    it '#to_s' do
      element = builder.input(:name, label: 'Name', value: 'Joseph Smith')
      element.to_s.must_equal %(<label>Name<input name="name" id="name" type="text" value="Joseph Smith"/></label>)
    end

    it '#to_s with errors' do
      element = builder.input(
        :name,
        label: 'Name',
        value: 'Joseph Smith',
        error: 'Something terrible happened'
      )
      element.to_s.must_equal %(<label class="is-invalid-label">Name<input name="name" id="name" type="text" class="is-invalid-input" value="Joseph Smith"/><span class="form-error is-visible">Something terrible happened</span></label>)
    end

    it '#to_s with hint' do
      element = builder.input(
        :name,
        label: 'Name',
        value: 'Joseph Smith',
        hint: 'Something helpful'
      )
      element.to_s.must_equal %(<label>Name<input name="name" id="name" type="text" aria-describedby="name_hint" value="Joseph Smith"/><p class="help-text" id="name_hint">Something helpful</p></label>)
    end
  end

  describe Formular::Elements::Foundation6::File do
    it '#to_s' do
      element = builder.file(:file, label: 'File Upload')
      element.to_s.must_equal %(<label for="file" class="button">File Upload</label><input name="file" id="file" type="file" class="show-for-sr"/>)
    end

    it '#to_s with errors' do
      element = builder.file(
        :file,
        label: 'File Upload',
        error: 'Something terrible happened'
      )
      element.to_s.must_equal %(<label for="file" class="button">File Upload</label><input name="file" id="file" type="file" class="show-for-sr"/><span class="form-error is-visible">Something terrible happened</span>)
    end
  end

  describe Formular::Elements::Foundation6::Checkbox do
    it '#to_s' do
      element = builder.checkbox(:public, value: 1, label: 'Public')
      element.to_s.must_equal %(<fieldset><input type="hidden" value="0" name="public"/><label><input name="public" id="public" type="checkbox" value="1"/> Public</label></fieldset>)
    end

    it '#to_s with errors' do
      element = builder.checkbox(
        :public,
        value: 1,
        label: 'Option 1',
        error: 'Something terrible happened'
      )
      element.to_s.must_equal %(<fieldset><input type="hidden" value="0" name="public"/><label class="is-invalid-label"><input name="public" id="public" type="checkbox" value="1"/> Option 1</label><span class="form-error is-visible">Something terrible happened</span></fieldset>)
    end

    describe 'with collection' do
      it '#to_s' do
        element = builder.checkbox(
          :public,
          label: 'Public',
          collection: collection_array
        )
        element.to_s.must_equal %(<fieldset><legend>Public</legend><label><input name="public[]" id="public_1" type="checkbox" value="1"/> Option 1</label><label><input name="public[]" id="public_2" type="checkbox" value="2"/> Option 2</label><input type="hidden" value="" name="public[]"/></fieldset>)
      end

      it '#to_s with errors' do
        element = builder.checkbox(
          :public,
          collection: collection_array,
          error: 'Something terrible happened'
        )
        element.to_s.must_equal %(<fieldset><label class="is-invalid-label"><input name="public[]" id="public_1" type="checkbox" value="1"/> Option 1</label><label class="is-invalid-label"><input name="public[]" id="public_2" type="checkbox" value="2"/> Option 2</label><input type="hidden" value="" name="public[]"/><span class="form-error is-visible">Something terrible happened</span></fieldset>)
      end
    end
  end

  describe Formular::Elements::Foundation6::Radio do
    it '#to_s' do
      element = builder.radio(:public, value: true, label: 'Public')
      element.to_s.must_equal %(<fieldset><label><input name="public" id="public" type="radio" value="true"/> Public</label></fieldset>)
    end

    it '#to_s with errors' do
      element = builder.radio(
        :public,
        value: 1,
        label: 'Option 1',
        error: 'Something terrible happened'
      )
      element.to_s.must_equal %(<fieldset><label class="is-invalid-label"><input name="public" id="public" type="radio" value="1"/> Option 1</label><span class="form-error is-visible">Something terrible happened</span></fieldset>)
    end

    describe 'with collection' do
      it '#to_s' do
        element = builder.radio(:public, collection: collection_array)
        element.to_s.must_equal %(<fieldset><label><input name="public" id="public_1" type="radio" value="1"/> Option 1</label><label><input name="public" id="public_2" type="radio" value="2"/> Option 2</label></fieldset>)
      end

      it '#to_s with errors' do
        element = builder.radio(
          :public,
          collection: collection_array,
          error: 'Something terrible happened'
        )
        element.to_s.must_equal %(<fieldset><label class="is-invalid-label"><input name="public" id="public_1" type="radio" value="1"/> Option 1</label><label class="is-invalid-label"><input name="public" id="public_2" type="radio" value="2"/> Option 2</label><span class="form-error is-visible">Something terrible happened</span></fieldset>)
      end
    end
  end

  describe Formular::Elements::Foundation6::StackedCheckbox do
    it '#to_s' do
      element = builder.stacked_checkbox(:public, value: 1, label: 'Public')
      element.to_s.must_equal %(<fieldset><input type="hidden" value="0" name="public"/><div><label><input name="public" id="public" type="checkbox" value="1"/> Public</label></div></fieldset>)
    end

    it '#to_s with errors' do
      element = builder.stacked_checkbox(
        :public,
        value: 1,
        label: 'Option 1',
        error: 'Something terrible happened'
      )
      element.to_s.must_equal %(<fieldset><input type="hidden" value="0" name="public"/><div><label class="is-invalid-label"><input name="public" id="public" type="checkbox" value="1"/> Option 1</label></div><span class="form-error is-visible">Something terrible happened</span></fieldset>)
    end

    describe 'with collection' do
      it '#to_s' do
        element = builder.stacked_checkbox(
          :public,
          collection: [[1, 'Option 1'], [2, 'Option 2']]
        )
        element.to_s.must_equal %(<fieldset><div><label><input name="public[]" id="public_1" type="checkbox" value="1"/> Option 1</label></div><div><label><input name="public[]" id="public_2" type="checkbox" value="2"/> Option 2</label></div><input type="hidden" value="" name="public[]"/></fieldset>)
      end

      it '#to_s with errors' do
        element = builder.stacked_checkbox(
          :public,
          collection: [[1, 'Option 1'], [2, 'Option 2']],
          error: 'Something terrible happened'
        )
        element.to_s.must_equal %(<fieldset><div><label class="is-invalid-label"><input name="public[]" id="public_1" type="checkbox" value="1"/> Option 1</label></div><div><label class="is-invalid-label"><input name="public[]" id="public_2" type="checkbox" value="2"/> Option 2</label></div><input type="hidden" value="" name="public[]"/><span class="form-error is-visible">Something terrible happened</span></fieldset>)
      end
    end
  end

  describe Formular::Elements::Foundation6::StackedRadio do
    it '#to_s' do
      element = builder.stacked_radio(:public, value: true, label: 'Public')
      element.to_s.must_equal %(<fieldset><div><label><input name="public" id="public" type="radio" value="true"/> Public</label></div></fieldset>)
    end

    it '#to_s with errors' do
      element = builder.stacked_radio(
        :public,
        value: 1,
        label: 'Option 1',
        error: 'Something terrible happened'
      )
      element.to_s.must_equal %(<fieldset><div><label class="is-invalid-label"><input name="public" id="public" type="radio" value="1"/> Option 1</label></div><span class="form-error is-visible">Something terrible happened</span></fieldset>)
    end

    describe 'with collection' do
      it '#to_s' do
        element = builder.stacked_radio(
          :public,
          collection: collection_array
        )
        element.to_s.must_equal %(<fieldset><div><label><input name="public" id="public_1" type="radio" value="1"/> Option 1</label></div><div><label><input name="public" id="public_2" type="radio" value="2"/> Option 2</label></div></fieldset>)
      end

      it '#to_s with errors' do
        element = builder.stacked_radio(
          :public,
          collection: collection_array,
          error: 'Something terrible happened'
        )
        element.to_s.must_equal %(<fieldset><div><label class="is-invalid-label"><input name="public" id="public_1" type="radio" value="1"/> Option 1</label></div><div><label class="is-invalid-label"><input name="public" id="public_2" type="radio" value="2"/> Option 2</label></div><span class="form-error is-visible">Something terrible happened</span></fieldset>)
      end
    end
  end

  describe Formular::Elements::Foundation6::Submit do
    it "#to_s" do
      builder.submit(value: "Submit!").to_s.must_equal %(<button class="success button" type="submit">Submit!</button>)
    end
  end
end
