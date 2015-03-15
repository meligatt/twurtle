class WordCloudController < ApplicationController
  def show
 	@search = $client.search(:handle,:result_type=>'mixed').take(10).collect
  end

  def create
  end
end
