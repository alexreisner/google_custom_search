def single_result_xml
  return <<-XML
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<GSP VER="3.2">
  <TM>0.228122</TM>
  <Q>banana</Q>
  <PARAM name="client" value="google-csbe" original_value="google-csbe" url_escaped_value="google-csbe" js_escaped_value="google-csbe"></PARAM>
  <PARAM name="cx" value="1234" original_value="1234" url_escaped_value="1234" js_escaped_value="1234"></PARAM>
  <PARAM name="num" value="20" original_value="20" url_escaped_value="20" js_escaped_value="20"></PARAM>
  <PARAM name="output" value="xml_no_dtd" original_value="xml_no_dtd" url_escaped_value="xml_no_dtd" js_escaped_value="xml_no_dtd"></PARAM>
  <PARAM name="q" value="banana" original_value="banana" url_escaped_value="banana" js_escaped_value="banana"></PARAM>
  <PARAM name="start" value="10" original_value="10" url_escaped_value="10" js_escaped_value="10"></PARAM>
  <PARAM name="adkw" value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" original_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" url_escaped_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" js_escaped_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU"></PARAM>
  <PARAM name="hl" value="en" original_value="en" url_escaped_value="en" js_escaped_value="en"></PARAM><PARAM name="oe" value="UTF-8" original_value="UTF-8" url_escaped_value="UTF-8" js_escaped_value="UTF-8"></PARAM>
  <PARAM name="ie" value="UTF-8" original_value="UTF-8" url_escaped_value="UTF-8" js_escaped_value="UTF-8"></PARAM>
  <PARAM name="boostcse" value="0" original_value="0" url_escaped_value="0" js_escaped_value="0"></PARAM>
  <Context>
    <title>COSM Search</title>
  </Context>
  <RES SN="1" EN="1">
    <M>1</M>
    <XT></XT>
    <RG START="1" SIZE="1">
    </RG>
    <RG START="1" SIZE="1">
    </RG>
    <R N="1">
      <U>https://cosm.com/feeds/1234</U>
      <UE>https://cosm.com/feeds/1234</UE>
      <T>Cosm - Air Quality &lt;b&gt;Banana&lt;/b&gt;</T>
      <RK>0</RK>
      <BYLINEDATE>1352448000</BYLINEDATE>
      <S>This is the air quality &lt;b&gt;banana&lt;/b&gt;!</S>
      <LANG>en</LANG>
      <Label>_cse_kc5qigqsb4a</Label>
      <HAS>
        <L/>
        <C SZ="30k" CID="sTTn04zEjwYJ"/>
        <RT/>
      </HAS>
    </R>
  </RES>
</GSP>
XML
end

def multiple_result_xml
  return <<-XML
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<GSP VER="3.2">
  <TM>0.228122</TM>
  <Q>raspberry</Q>
  <PARAM name="client" value="google-csbe" original_value="google-csbe" url_escaped_value="google-csbe" js_escaped_value="google-csbe"></PARAM>
  <PARAM name="cx" value="1234" original_value="1234" url_escaped_value="1234" js_escaped_value="1234"></PARAM>
  <PARAM name="num" value="2" original_value="2" url_escaped_value="2" js_escaped_value="2"></PARAM>
  <PARAM name="output" value="xml_no_dtd" original_value="xml_no_dtd" url_escaped_value="xml_no_dtd" js_escaped_value="xml_no_dtd"></PARAM>
  <PARAM name="q" value="raspberry" original_value="raspberry" url_escaped_value="raspberry" js_escaped_value="raspberry"></PARAM>
  <PARAM name="start" value="10" original_value="10" url_escaped_value="10" js_escaped_value="10"></PARAM>
  <PARAM name="adkw" value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" original_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" url_escaped_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" js_escaped_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU"></PARAM>
  <PARAM name="hl" value="en" original_value="en" url_escaped_value="en" js_escaped_value="en"></PARAM><PARAM name="oe" value="UTF-8" original_value="UTF-8" url_escaped_value="UTF-8" js_escaped_value="UTF-8"></PARAM>
  <PARAM name="ie" value="UTF-8" original_value="UTF-8" url_escaped_value="UTF-8" js_escaped_value="UTF-8"></PARAM>
  <PARAM name="boostcse" value="0" original_value="0" url_escaped_value="0" js_escaped_value="0"></PARAM>
  <Spelling>
    <Suggestion q="raspberry"><b><i>raspberry</i></b></Suggestion>
  </Spelling>
  <Context>
    <title>COSM Search</title>
  </Context>
  <RES SN="11" EN="12">
    <M>123</M>
    <XT></XT>
    <R N="11">
      <U>https://cosm.com/feeds/1234</U>
      <UE>https://cosm.com/feeds/1234</UE>
      <T>Cosm - Air Quality &lt;b&gt;Raspberry&lt;/b&gt; 1</T>
      <RK>0</RK>
      <BYLINEDATE>1352448000</BYLINEDATE>
      <S>This is the air quality &lt;b&gt;raspberry&lt;/b&gt; one!</S>
      <LANG>en</LANG>
      <Label>_cse_kc5qigqsb4a</Label>
      <HAS>
        <L/>
        <C SZ="30k" CID="sTTn04zEjwYJ"/>
        <RT/>
      </HAS>
    </R>
    <R N="12">
      <U>https://cosm.com/feeds/1235</U>
      <UE>https://cosm.com/feeds/1254</UE>
      <T>Cosm - Air Quality &lt;b&gt;Raspberry&lt;/b&gt; 2</T>
      <RK>0</RK>
      <BYLINEDATE>1352448000</BYLINEDATE>
      <S>This is the air quality &lt;b&gt;raspberry&lt;/b&gt; two!</S>
      <LANG>en</LANG>
      <Label>_cse_kc5qigqsb4a</Label>
      <HAS>
        <L/>
        <C SZ="30k" CID="sTTn04zEjwYJ"/>
        <RT/>
      </HAS>
    </R>
  </RES>
</GSP>
XML
end

def no_result_xml
  return <<-XML
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<GSP VER="3.2">
  <TM>0.228122</TM>
  <Q>squash</Q>
  <PARAM name="client" value="google-csbe" original_value="google-csbe" url_escaped_value="google-csbe" js_escaped_value="google-csbe"></PARAM>
  <PARAM name="cx" value="1234" original_value="1234" url_escaped_value="1234" js_escaped_value="1234"></PARAM>
  <PARAM name="num" value="20" original_value="20" url_escaped_value="20" js_escaped_value="20"></PARAM>
  <PARAM name="output" value="xml_no_dtd" original_value="xml_no_dtd" url_escaped_value="xml_no_dtd" js_escaped_value="xml_no_dtd"></PARAM>
  <PARAM name="q" value="squash" original_value="squash" url_escaped_value="squash" js_escaped_value="squash"></PARAM>
  <PARAM name="start" value="10" original_value="10" url_escaped_value="10" js_escaped_value="10"></PARAM>
  <PARAM name="adkw" value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" original_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" url_escaped_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU" js_escaped_value="AELymgVtAyEYpqw551NwGGLzmhNM93LmcJKxnsjMeSmBYelXTE2IN9Jx4a4KR4hNLPqmaRMtGJpOL13hCcH3UTcYmG5Lmj63Uk9FmhSfLpuakRGHnYa4ghSZJPDml_sBEizUdyxFPIO_kjf6rXmZ1SJyhDcNky0zi_1gRAyzt4pu-SswMP7nOhjoUpTz-tD7ezDt1RcyRJb7MSBhX1rxoVbAHtNOAmVtiv06QLFVNHJK_ltq7U7bECU"></PARAM>
  <PARAM name="hl" value="en" original_value="en" url_escaped_value="en" js_escaped_value="en"></PARAM><PARAM name="oe" value="UTF-8" original_value="UTF-8" url_escaped_value="UTF-8" js_escaped_value="UTF-8"></PARAM>
  <PARAM name="ie" value="UTF-8" original_value="UTF-8" url_escaped_value="UTF-8" js_escaped_value="UTF-8"></PARAM>
  <PARAM name="boostcse" value="0" original_value="0" url_escaped_value="0" js_escaped_value="0"></PARAM>
  <Context>
    <title>COSM Search</title>
  </Context>
</GSP>
XML
end
