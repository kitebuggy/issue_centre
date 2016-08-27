# get_contracts response
gc_xml = %{
<env:Envelope xmlns:env='http://schemas.xmlsoap.org/soap/envelope/'>
  <env:Header>
  </env:Header>
  <env:Body>
    <ns2:getContractsResponse xmlns:ns2=\"http://wrappers.webservice.firstoption.com/\">
      <return>
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE contracts SYSTEM "http://support.callclosed.net/issuecentre/dtd/getContracts.dtd">
        <contracts defaultContract="300006" />
      </return>
    </ns2:getContractsResponse>
  </env:Body>
</env:Envelope>
}

gc_xml_text = %{
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE contracts SYSTEM "http://support.callclosed.net/issuecentre/dtd/getContracts.dtd">
<contracts defaultContract="300006" />
}

# generate_key response
gk_xml = %{
<env:Envelope xmlns:env='http://schemas.xmlsoap.org/soap/envelope/'>
  <env:Header>
  </env:Header>
  <env:Body>
    <ns2:generateKeyResponse xmlns:ns2=\"http://wrappers.webservice.firstoption.com/\">
      <return>
        <?xml version="1.0"; encoding="UTF-8"?>
        <!DOCTYPE generateKey SYSTEM "http://support.callclosed.net/issuecentre/dtd/generateKey.dtd">
        <return error="0" id="400043">
          1ff961326ecf84caa343754664693be3fdc861dd43ba55397d0eadcd07e1bc8ca0a73861ab1a9f7693dc87d5582c1d77
        </return>
      </return>
    </ns2:generateKeyResponse>
  </env:Body>
</env:Envelope>
}

gk_xml_text = %{
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generateKey SYSTEM "http://support.callclosed.net/issuecentre/dtd/generateKey.dtd">
<return error="0" id="400043">
  1ff961326ecf84caa343754664693be3fdc861dd43ba55397d0eadcd07e1bc8ca0a73861ab1a9f7693dc87d5582c1d77
</return>
}

# get_companies
# 
# <companies>
#   [...]
#   <company id=\"405987\" notifyoptout=\"no\">
#     <name>Palo Verde Nuclear Generating Station</name>
#     <contract>300006</contract>
#     <country>13</country>
#     <notificationDisabled>0</notificationDisabled>
#     <address>nk</address>
#     <fax></fax>
#     <telephone></telephone>
#     <generic></generic>
#     <notes></notes>
#   </company>
#   <company id=\"405988\" notifyoptout=\"no\">
#     <name>Picosecond Pulse Labs</name>
#     <contract>300006</contract>
#     <country>13</country>
#     <notificationDisabled>0</notificationDisabled>
#     <address>2500 55th Street\r\nBoulder, Colorado 80301, USA</address>
#     <fax></fax>
#     <telephone>303.443.1249</telephone>
#     <generic></generic>
#     <notes></notes>
#   </company>
# </companies>
