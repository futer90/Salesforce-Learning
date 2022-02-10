public class ContactSearch {
    public static List <Contact> searchForContacts(String last_name, String postal_code){
        List <Contact> cts  = [SELECT Name, MailingPostalCode FROM Contact WHERE LastName=:last_name and MailingPostalCode=:postal_code];
        System.debug(cts);
    	return cts ;
    }
}