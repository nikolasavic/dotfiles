## YADM

### Alternative files
* To switch between alternative files  
`yadm config local.class work`  
`yadm config local.class person`  

* If you changed the `.gitconfig` file in the process due to class switches, you'll need to restore the appropriate file for the current class  
`yadm checkout .gitignore`


### Multiple Github Accounts
If you use multiple github accounts there are other considerations
  * The `.gitconfig` file is used only to determine which account the commit is signed with
  * When pushing your code, you need to set up your ssh config file to include both accounts and then configure the remote upstreams to use the correct account:
    * ```
      Host github-1
        Hostname github.com
        User git
        IdentifyFile /Users/me/.ssh/personal_private_key_1

      Host github-2
        Hostname github.com
        User git
        IdentifyFile /Users/me/.ssh/personal_private_key_2
    ```
    * Set remote upstream with:  
    `yadm remote set-url origin github-1:githubAccountName/MyRepo.git`
