## Java version management

### Install and Set up
* Install jenv  
`brew install jenv`

* Install JDKs  
`brew install --cask AdoptOpenJDK/openjdk/adoptopenjdk{8,11}`

* Add JDKs to jenv  
```
Syntax: 
jenv add <your_jdk_path>
Example:
jenv add /Library/Java/JavaVirtualMachines/openjdk-14.0.1.jdk/Contents/Home
```


### Misc
* List all JDK versions  
`/usr/libexec/java_home -V`

reference:
 * https://chamikakasun.medium.com/how-to-manage-multiple-java-version-in-macos-e5421345f6d0
 * https://www.jenv.be/
