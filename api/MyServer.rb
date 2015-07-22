class MyServer < SOAP::RPC::StandaloneServer

  def initialize(*args)
    add_method(self,'add','a','b')
    add_method(self,'div','a','b')
  end


   def add(a,b)
     return a + b
   end

   def div (a,b)
     return a / b
   end

end

server = MyServer.new("MyServer",
                      'urn:ruby:calculation', 'localhost', 3000)
