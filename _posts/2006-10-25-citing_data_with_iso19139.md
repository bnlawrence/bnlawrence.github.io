---
layout: post
title: Citing data with ISO19139
last_modified: Wednesday 25 October, 2006
tags: iso19115 metadata ndg claddier
categories: computing
---
I thought I might try and work out exactly what tags I might use for my [previous citation example]({% post_url 2006-10-20-citation_hosting_and_publication %}), if I was using ISO19139 (i.e. in the metadata of another dataset).

The appropriate piece of ISO19139/19115 is the [CI_Citation](/assets/images/ISO19115_CI_Citation.jpg) element, which *defines the metadata describing authoratative reference information ...* which in my mind should also include other datasets!

Some if it is "straight forward" (I don't plan to admit how long it took to work this out :-) :
~~~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<CI_Citation  xmlns="http://www.isotc211.org/2005/gmd"
    xmlns:gco="http://www.isotc211.org/2005/gco"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.isotc211.org/2005/gmd http://www.isotc211.org/2005/gmd/citation.xsd">
    <!-- This doesn't validate using the citation.xsd above, but it does validate with local copies of the gmd schemae -->
   <title>
        <gco:CharacterString>Mesosphere-Stratosphere-Troposphere Radar at Aberystwyth
        </gco:CharacterString>
    </title>
    <alternateTitle>
        <gco:CharacterString>MST</gco:CharacterString>
    </alternateTitle>
    <date>
        <CI_Date>
            <date>
                <gco:Date>2006</gco:Date>
            </date>
            <dateType>
                <CI_DateTypeCode
                    codeList="http://www.isotc211.org/2005/resources/CodeList/gmxCodelists.xml#CI_DateTypeCode"
                    codeListValue="publication"/>
            </dateType>
        </CI_Date>
    </date>
    <identifier>
        <MD_Identifier>
            <code>
                <gco:CharacterString>badc.nerc.ac.uk/data/mst/v3/upd15032006</gco:CharacterString>
            </code>
        </MD_Identifier>
    </identifier>
    <citedResponsibleParty>
        <CI_ResponsibleParty>
            <organisationName>
                <gco:CharacterString>Natural Environment Research Council</gco:CharacterString>
            </organisationName>
            <role>
                <CI_RoleCode
                    codeList="http://www.isotc211.org/2005/resources/CodeList/gmxCodelists.xml#CI_RoleCode"
                    codeListValue="Author"/>
            </role>
        </CI_ResponsibleParty>
    </citedResponsibleParty>
    <citedResponsibleParty>
        <CI_ResponsibleParty>
            <organisationName>
                <gco:CharacterString>British Atmospheric Data Centre</gco:CharacterString>
            </organisationName>
            <role>
                <CI_RoleCode
                    codeList="http://www.isotc211.org/2005/resources/CodeList/gmxCodelists.xml#CI_RoleCode"
                    codeListValue="Publisher"/>
            </role>
        </CI_ResponsibleParty>
    </citedResponsibleParty>
    <citedResponsibleParty>
        <CI_ResponsibleParty>
            <organisationName>
                <gco:CharacterString>British Atmospheric Data Centre</gco:CharacterString>
            </organisationName>
            <contactInfo><CI_Contact><onlineResource><CI_OnlineResource>
                <linkage><URL>http://badc.nerc.ac.uk/data/mst/v3/</URL></linkage>
                <function><CI_OnLineFunctionCode codeList="http://www.isotc211.org/2005/resources/CodeList/gmxCodelists.xml#CI_OnlineFunctionCode" codeListValue="download"></CI_OnLineFunctionCode></function>
            </CI_OnlineResource>
            </onlineResource></CI_Contact></contactInfo>
            <role><CI_RoleCode codeList="http://www.isotc211.org/2005/resources/CodeList/gmxCodelists.xml#CI_RoleCode" codeListValue="custodian"></CI_RoleCode></role>
            <!-- but i don't really understand the distinction between cutodian, resourceProvider and distributor -->
        </CI_ResponsibleParty>
    </citedResponsibleParty>
    <presentationForm>
        <CI_PresentationFormCode
            codeList="http://www.isotc211.org/2005/resources/CodeList/gmxCodelists.xml#CI_PresentationFormCode"
            codeListValue="profileDigital"/>
    </presentationForm>
</CI_Citation>


~~~~~

OK, it's pretty nasty in terms of verbiage, but as (some) folk keep saying, this is for computers not humans  - never mind that a human has to write some code to handle it  - but it's not as bad as I feared!

In getting that far, we see that I've nearly managed to get the same information content, but there are some pretty important omissions (I think, caveat emptor, I'd glad to be wrong about this):
1.  I don't see any way to indicate that the dataset is being updated (the "ongoing" tag in my previous example", ideally this would require a spot for an MD_MaintenanceFrequencyCode in the citation).1. I don't see any way of indicating a particular part of a dataset (that is, having separate identifiers both for the dataset and for particular features within it).1. Despite support for feature-type descriptions within an ISO19139 document proper (in the MD_FeatureTypeDescription tag), one can't identify which features are in a cited dataset. We're reduced to using  CI_PresentationFormCode, which strikes me to be a completely ugly compromise between feature descriptions and a text element. The one I've chosen here (profile) is partly right, but doesn't get across that this dataset consists of timeseries of vertical profiles!1. One can't, as far as I can see, identify when the dataset was accessed (or the date of the citations validity) and I think this is rather crucial for citation of online material.

I guess those are the minimum extensions we'd need to support citeable datasets! (By the way, I've ignored the option of using otherCitationDetails as one is only allow one of those in the citation!)

**Update**: Note that BADC appears as both a publisher and a custodian, actually, following my [discussion of the distinction](blog/2006/10/20/citation_hosting_and_publication), I think at the moment, one would want to remove the publisher role ... and leave only the custodian role (in the ISO19139, the text citation form can't distinguish between these roles).

#### comments (1)
*[Ken Hale](ken.hale@ionicenterprise.com) (on Monday 21 May, 2007)*
Hi Bryan,

Can you offer any insight into how an XSLT script for an ISO 19139 document like yours would deal with absoulute and relative URI's for the codelist attributes?  I was hoping to see a reference to an xml:base attribute like this one at the top of your document:

xml:base = "http://www.isotc211.org/schemas/2005/resources/Codelist/" xlink:href = "gmxCodelists.xml".

Since it's not there to resolve the URI, how do you recommend writing an XSLT script that could read the various codelist values assigned to the ISO 19139 codelist elements in the xml file?  I found this XSLT snippet which I haven't figured out how to work:

<xsl:template match="codelist">
   <xsl:text><!ENTITY % </xsl:text>
      <xsl:value-of select="@name"/>
         <xsl:text> '%CodeListValue;'>
    </xsl:text>
 </xsl:template>

ESRI uses this to resolve attribute values against an xml file and outputs them as a .dtd file.

I'm not an XSLT or an ISO 19139 metadata guy, so please bear with me if my question sounds confusing!

Thanks,
Ken
