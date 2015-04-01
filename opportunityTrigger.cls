trigger opportunityTrigger on Opportunity (before insert, before update, after insert, after update, after delete, after undelete) {


// other trigger logic here


/** 
 ** October 22, 2013
 ** Author: Jenna Vuong 
 ** Description: Custom roll-up summary of oppty amounts to Transaction_Amount__c on portfolio
 **/

if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete || Trigger.isUndelete)) {

    Set<Id> portfolioIds = new Set<Id>();
    
    // add portfolio ids coming from new data
    if (Trigger.new != null) {
        for (Opportunity o : Trigger.new) {
        
            // only add opps with valid portfolio id
            if (o.Portfolio__c != null) {
                portfolioIds.add(o.Portfolio__c);
            }
        }
    }
    
    // add portfolio ids coming from old data (deletes, moving an opp from one portfolio to another)
    if (Trigger.old != null) {
        for (Opportunity o : Trigger.old) {
        
            // only add opps with valid portfolio id
            if (o.Portfolio__c != null) {
                portfolioIds.add(o.Portfolio__c);
            }
        }
    }
    
    if (portfolioIds.size() > 0) {
        TransAmtRollUp.calculateTransAmt(portfolioIds);
    }

}     
}
