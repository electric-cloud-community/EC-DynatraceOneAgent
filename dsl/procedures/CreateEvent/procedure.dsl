// This procedure.dsl was generated automatically
// === procedure_autogen starts ===
procedure 'CreateEvent', description: 'Create an Event', {

    step 'CreateEvent', {
        description = ''
        command = new File(pluginDir, "dsl/procedures/CreateEvent/steps/CreateEvent.pl").text
        shell = 'ec-perl'
        
        
        
    }


    formalOutputParameter 'event',
        description: 'JSON representation of the deployed application'
// === procedure_autogen ends, checksum: 397b37ffedfd60e0bdae0d839928f553 ===
// Do not update the code above the line
// procedure properties declaration can be placed in here, like
// property 'property name', value: "value"
}