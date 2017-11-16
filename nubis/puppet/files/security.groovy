#!groovy

import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

println "--> set authorization strategy"
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(true)
instance.setAuthorizationStrategy(strategy)

println "--> creating proxy configuration"
def proxy = new hudson.ProxyConfiguration('proxy.service.consul', 3128, '', '', '127.0.0.1,169.254.169.254')
instance.proxy = proxy

instance.save()
