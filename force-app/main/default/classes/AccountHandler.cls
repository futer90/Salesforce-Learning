public class AccountHandler {
    public static Account insertNewAccount (String acc_name){
       
            
         
        if (acc_name != ''){
            try{
                
               
           Account acnt = new Account(name=acc_name);
           insert acnt;
           return acnt;               
        }
            catch (DmlException e){
                System.debug('Account was not created');
                return(null);
            }
        
        }
        else {
        
            return null;
            
        }
     }
}