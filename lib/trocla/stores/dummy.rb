# a simple in memory store just as an example

require 'securerandom'

class Trocla::Stores::Dummy < Trocla::Store
  def get(key,format)
    if ( key !~ /^unset_/ )
		fake_format(key, format)
    else
      nil
    end
  end


  def set(key,format,value,options={})
  end

  def delete(key,format=nil)
  end

  def set_plain(key,value,options)
  end

  def set_format(key,format,value,options)
  end

  def delete_all(key)
  end

  def delete_format(key,format)
  end

  private
  def fake_format(key, format)

    if format == "x509"
		 fake_x509(key)
    else
       format + "_" + SecureRandom.uuid 
    end
  end

  private 
  def fake_x509(key)

    # TODO: create random keypairs here
    output = %{
-----BEGIN PRIVATE KEY-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDBS7EeI1UwluNF
sJpZbouCSj1ei02zGUESb/D6/8VW9YjtjKc7fYsAGcj2SgvTCc3mgwxulOdD6Rs0
Z3uZXLye0XfPI3ImdbBd2VVYw90Dt/svV0KTdu3Osc+2bmZLbk7PPXGkeEj0bwJM
2Wct9A5z0yyxfozINvOvntcQus1zsJBW2dHd9xIfMs61S956i76QmCCyQz94Mblv
qS58jE3mydatbaMxN05NKFl1DbIIdPxkKbxLwiIpb9LbsbSiTzLVfyK6hCnrQ5NB
0C1nZ3DBk1/xypV1WKRupTCIUnYO87P6KfJiXMX2QJ9PC+4HHYZmWKfCyVUP2SRq
LFPOfQL/AgMBAAECggEAFgLvlXYCknjsQphcy0haXKjlmimU3ItIrLfQolST/VYS
lLKKrKycMpO9HcbK1+pq5xAPT1xnhYU7Etmh6pHz7MX/tbfcnOKUBevk2ynatjyy
Pu7Z5v8JD5uSAr1JqtdR5CmkEk2cSTGG+odbR5FeP/RRR5kYoQgY8evNo9sR4FWN
QFqyuSoQSjNldq310MHcODLdk7RcwGeYwvnIg7KNbCrAjvTK7ZQzk804rRk/cu1e
uMV8YmUHDzIpenbpOInnFExM6abfLQFEnqNBy4o/s1kHaMPiY4+QUPE5hOKmAQbC
HEbSaUYUnNU0fIl9tR4hvRVDa+miF1z1ljObS/UiIQKBgQDfQS0bWrMTITgJEoZr
4L29nSuIptjC9vCp4hUALPdyZMe8crfXkg2c8Qahq1+P3ccul/Hfs71d0RdC2b+5
UiqjRj7AOIeOmax8UF7ebmKDXEdmSKguvp3X3v7mcArjNkdSqw8J9euqq2B0/wck
QT1oKr5w26/kQ2adKmZDjRPgEQKBgQDdpZwkY3l1SuWM3MvyuwVM3ERdXh8bpHiO
fLezmBhENXkkSjy2Ge1iMIF5ai86wXHjrYtq2cMy/1uGEppZdUnKyw/odfz9baJs
Hp+RWurQmGq3+nSnSk0I/CFIV3WK98s/ariSu4bS84wugZ74RC7Y7y0dcbbSFK/U
JmIWuCbCDwKBgQDPsYmuHgXkcQ35WrOVHqJGCTabzWRwlFy2Hq6c2DhnwpwSk8K2
GJjzfUNHGfAwHgmULiUFkOhFpCR4u6xiUq957/qmxrBNmGdfy0FGuviI7ks6O7PC
sPCVCE6owGlQkYluvdai1Jam0wJMNYlGUC85fjJnOel7eLy4z94NT+zCkQKBgQDD
sX+t5SIMvEb2Ws+7DQK9/NBje0GN/2XtsBHlgEkUl/3QW7dEtJmRkvANygHPJ5Kt
icFJYuDkeu9M7cnXaCXx5d2yydHH0++O9G7AQHyIFbpLm9c5CPIBF9Mu8wE15FhQ
MqKp8uY0BJJlUU6RNmoCYRH9KDRZQaiIcCc0lfyqYwKBgQCa8sTuxaCMZXEDA+Y0
5X6TxlLAc7LnJThMQNm0rbnuWg6qVDO1hu6EwdauxcwxT4yDXBgqlKTs9dEU4BvG
lSEV8z1iGqSiioh0Z7kgnPJwt4dDt2vwtNjHCZRAL3pWuvdVD1npSZZtNmX1Iz27
OGjBrR+AIQKa8koE1PenP2JmsA==
-----END PRIVATE KEY-----
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwUuxHiNVMJbjRbCaWW6L
gko9XotNsxlBEm/w+v/FVvWI7YynO32LABnI9koL0wnN5oMMbpTnQ+kbNGd7mVy8
ntF3zyNyJnWwXdlVWMPdA7f7L1dCk3btzrHPtm5mS25Ozz1xpHhI9G8CTNlnLfQO
c9MssX6MyDbzr57XELrNc7CQVtnR3fcSHzLOtUveeou+kJggskM/eDG5b6kufIxN
5snWrW2jMTdOTShZdQ2yCHT8ZCm8S8IiKW/S27G0ok8y1X8iuoQp60OTQdAtZ2dw
wZNf8cqVdVikbqUwiFJ2DvOz+inyYlzF9kCfTwvuBx2GZlinwslVD9kkaixTzn0C
/wIDAQAB
-----END PUBLIC KEY-----
}
    output
  end
  
end
