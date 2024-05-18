<!-- ========================== -->
<!--  Author : Baptiste Durand  -->
<!-- ========================== -->

Idea of obfuscation :
1. Replace the name of all the items by random stuff. What I mean by all items is inputs, outputs, variables, signals, names of components, generics, generates
2. Replaces all gates by NAND gates


1. 
Their will be a json here with a dict containing all the assignment.
The hierarchy of the json file will be the following :
{
    "original_entity_name_0": {
        "original_entity_name_(same as above)": "new_entity_name",
        "generics": {
            "original_generics_0": "new_generics_0",
            "original_generics_1": "new_generics_1"
        },
        "ports": {
            "original_port_name_0": "new_port_name_0",
            "original_port_name_1": "new_port_name_1",
            "original_port_name_2": "new_port_name_2"
        },
        "compenents": {
            "original_component_name_0_(refer to an other entity name)": "new_component_name_0",
            "original_component_name_1_(refer to an other entity name)": "new_component_name_1"
        },
        "signals": {
            "original_signal_name_0": "new_signal_name_0",
            "original_signal_name_1": "new_signal_name_1",
            "original_signal_name_2": "new_signal_name_2"
        },
        "port_maps": {
            "original_port_map_name_0": "new_port_map_name_0"
        },
        "generates": {
            "original_generate_name_0": "new_generate_name_0"
        }
    },
    "original_entity_name_1": {

    }
}


2.1. 
NOT with NAND : 
1 gate -> 
o = a nand a 

AND with NAND :
2 gates ->
o = (a nand b) nand (a nand b)

OR with NAND :
3 gates ->
o = (a nand a) nand (b nand b)

NOR with NAND :
4 gates ->
o = (a nand a) nand (b nand b) nand (a nand a) nand (b nand b)

XOR with NAND :
5 gates ->
o = (a nand (a nand b)) nand (b nand (a nand b))

2.2.
Add a possibility to use NOR insted of NAND