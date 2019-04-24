package EC::Plugin::DynatraceOneAgent;
use strict;
use warnings;
use base qw/ECPDF/;
use Data::Dumper;
# Feel free to use new libraries here, e.g. use File::Temp;

# Service function that is being used to set some metadata for a plugin.
sub pluginInfo {
    return {
        pluginName    => '@PLUGIN_KEY@',
        pluginVersion => '@PLUGIN_VERSION@',
        configFields  => ['config'],
        configLocations => ['ec_plugin_cfgs']
    };
}


# Auto-generated method for the procedure CreateEvent/CreateEvent
# Add your code into this method and it will be called when step runs
sub createEvent {
    my ($pluginObject) = @_;
    my $context = $pluginObject->newContext();
    my $params = $context->getStepParameters();
    print "Parameters: " . Dumper $params;
    # Config is an ECPDF::Config object;
    my $config = $context->getConfigValues();
    print "Configuration: " . Dumper $config;

    my $authToken = $params->getValue('token');
    my $url = $params->getValue('endpoint');
    if (!$url->isValid()) {
        $pluginObject->bail_out("Url %s is invalid", $url);
    }
    $url .= "api/v1/events";

    my $host=$params->getValue('host');
    my $annotation=$params->getValue('annotationDescription');
    my $PAYLOAD=qq{
      {
        "eventType": "CUSTOM_ANNOTATION",
  		  "start": $[/javascript (Date.now() + 100000).toString()],
  		  "end": $[/javascript (Date.now() + 100000).toString()],
  		  "timeoutMinutes": 0,
  		  "attachRules": {
    			"entityIds": [
    			  "$host"
    			],
    			"tagRule": [
    			  {
      				"meTypes": [
      				  "HOST"
      				],
      				"tags": [
      				  {
      					"context": "CONTEXTLESS",
      					"key": "customTag"
      				  }
      				]
    			  }
    			]
  		  },
  		  "source": "OpsControl",
  		  "annotationType": "defect",
  		  "annotationDescription": "$annotation"
      }
    };

    # loading component here using PluginObject;
    my $restComponent = $pluginObject->loadComponent('REST');
    my $request = $restComponent->newRequest('POST' => $url, $PAYLOAD);
    $request->auth('Api-Token', $authToken);

    my $response = $restComponent->doRequest($request);
    my $stepResult = $context->newStepResult();

    if ($response->success()) {
        $stepResult->success();
        $stepResult->setMessage("REST request with method POST to %s has been successful", $url);
    }
    else {
        $stepResult->failure();
        $stepResult->setMessage("Failed during REST request to %s using POST", $url);
        # this will abort whole procedure during apply, otherwise just step will be aborted.
        $stepResult->abortProcedureOnApply(1);
    }

    $stepResult->apply();
}
## === step ends ===
# Please do not remove the marker above, it is used to place new procedures into this file.


1;
