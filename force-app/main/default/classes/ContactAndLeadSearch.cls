public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String nm){
        
        List<List<sObject>> searchList = [FIND:nm IN ALL FIELDS RETURNING Lead(FirstName, LastName),Contact(FirstName,LastName)];
        return searchList;
    }
}