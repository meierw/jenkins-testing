import jenkins.model.Jenkins
import hudson.security.HudsonPrivateSecurityRealm
import hudson.security.FullControlOnceLoggedInAuthorizationStrategy

def instance = Jenkins.get()

instance.setSecurityRealm(new HudsonPrivateSecurityRealm(false))
def user = instance.getSecurityRealm().createAccount('admin', 'admin')
user.save()

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)
instance.save()
