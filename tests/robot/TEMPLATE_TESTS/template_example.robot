# Copyright (c) 2019 Wladislaw Wagner (Vitasystems GmbH), Pablo Pazos (Hannover Medical School),
# Nataliya Flusman (Solit Clouds), Nikita Danilin (Solit Clouds)
#
# This file is part of Project EHRbase
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



*** Settings ***
Documentation   Composition Integration Tests
...             https://github.com/ehrbase/ehrbase/blob/develop/doc/conformance_testing/EHR_COMPOSITION.md#b6a-main-flow-create-new-event-composition
Metadata        TOP_TEST_SUITE    COMPOSITION

Resource        ../_resources/keywords/composition_keywords.robot
#Resource        ../_resources/keywords/aql_query_keywords.robot
#Resource        ../_resources/keywords/directory_keywords.robot

#Suite Setup       Precondition
Suite Teardown  restart SUT


*** Test Cases ***
Test Example Generator for Templates (ECIS)
    [Tags]
    Create Template    all_types/ehrn_family_history.opt
    Extract Template_id From OPT File
    #get web template by template id     ${template_id}
    get example of web template by template id      ${template_id}      JSON
    get example of web template by template id      ${template_id}      XML
    #commit composition   format=FLAT
    #...                  composition=family_history__.json
    #check the successful result of commit composition
    #(FLAT) get composition by composition_uid    ${composition_uid}
    #Get Web Template By Template Id  ${template_id}
    #(FLAT) get composition by composition_uid    ${composition_uid}
    #Update Composition (FLAT)  family_history.v2__.json
    #(FLAT) get composition by composition_uid    ${composition_uid}
    #check composition exists

    #${composition_uid_short}=  Fetch From Left  ${composition_uid}  :
    #Replace Uid With Actual  robot/_resources/test_data_sets/directory/empty_directory_items.json  ${composition_uid_short}  robot/_resources/test_data_sets/directory/empty_directory_items_uid_replaced.json
    #create DIRECTORY (JSON)    empty_directory_items_uid_replaced.json
    #Should Be Equal As Strings    ${response.status_code}    201
    #remove File  robot/_resources/test_data_sets/directory/empty_directory_items_uid_replaced.json

    #execute ad-hoc query    B/102_get_compositions_orderby_name.json
    #check response: is positive

    #[Teardown]    restart SUT



*** Keywords ***
Create Template
    [Arguments]     ${fileLocation}
    upload OPT ECIS     ${fileLocation}
#Precondition
#    Upload OPT    all_types/family_history.opt
#    Upload OPT    nested/nested.opt
#    upload OPT    minimal/minimal_observation.opt
#    Extract Template_id From OPT File