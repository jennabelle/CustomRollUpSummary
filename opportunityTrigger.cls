{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 ArialMT;\f1\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red26\green26\blue26;\red255\green255\blue255;\red255\green255\blue193;
}
\margl1440\margr1440\vieww15180\viewh12580\viewkind0
\deftab720
\pard\pardeftab720\sl340

\f0\fs26 \cf2 \cb3 trigger opportunityTrigger on Opportunity (before insert, before update, after insert, after update, after delete, after undelete) \{
\f1\fs24 \cf0 \cb1 \
\pard\pardeftab720
\cf0 \
\
\pard\pardeftab720\sl340

\f0\fs26 \cf2 \cb3 // other trigger logic here
\f1\fs24 \cf0 \cb1 \
\pard\pardeftab720
\cf0 \
\
\pard\pardeftab720\sl340

\f0\fs26 \cf2 \cb3 /** 
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  ** October 22, 2013
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  ** Author: Jenna Vuong 
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  ** Description: Custom roll-up summary of oppty amounts to Transaction_Amount__c on portfolio
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  **/
\f1\fs24 \cf0 \cb1 \
\pard\pardeftab720
\cf0 \
\pard\pardeftab720\sl340

\f0\fs26 \cf2 \cb3 if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete)) \{
\f1\fs24 \cf0 \cb1 \
\pard\pardeftab720
\cf0 \
\pard\pardeftab720\sl340

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0Set<Id> portfolioIds = new Set<Id>();
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0// add portfolio ids coming from new data
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0if (Trigger.new != null) \{
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0for (Opportunity o : Trigger.new) \{
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0// only add opps with valid portfolio id
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0if (o.Portfolio__c != null) \{
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0portfolioIds.add(o.Portfolio__c);
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\}
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\}
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\}
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0// add portfolio ids coming from old data (deletes, moving an opp from one portfolio to another)
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0if (Trigger.old != null) \{
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0for (Opportunity o : Trigger.old) \{
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0// only add opps with valid portfolio id
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0if (o.Portfolio__c != null) \{
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0portfolioIds.add(o.Portfolio__c);
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\}
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\}
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\}
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0if (portfolioIds.size() > 0) \{
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\'a0\'a0\'a0\'a0\cb4 TransAmtRollUp\cb3 .calculateTransAmt(portfolioIds);
\f1\fs24 \cf0 \cb1 \

\f0\fs26 \cf2 \cb3  \'a0\'a0\'a0\}
\f1\fs24 \cf0 \cb1 \
\pard\pardeftab720
\cf0 \
\pard\pardeftab720\sl340

\f0\fs26 \cf2 \cb3 \} \'a0\'a0\'a0\'a0
\f1\fs24 \cf0 \cb1 \
\pard\pardeftab720

\f0\fs26 \cf2 \cb3 \}}