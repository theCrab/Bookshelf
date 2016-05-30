require 'spec_helper'
require_relative '../../../../apps/web/views/books/new'

describe Web::Views::Books::New do
  let(:exposures) { Hash[book: {}] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/new.html.erb') }
  let(:view)      { Web::Views::Books::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #book' do
    view.book.must_equal exposures.fetch(:book)
  end
end
