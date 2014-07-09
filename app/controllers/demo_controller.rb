class DemoController < ApplicationController
  
 layout false




  def index

  	#render('demo/hello')
  	render('hello')
  end

  def hello
  render('index')
  end

  def other_hello
  	redirect_to ("http://lynda.com")
  end


end
