/*
 * Copyright (c) 2020 Vitasystems GmbH, Hannover Medical School, and Luis Marco-Ruiz (Hannover Medical School).
 *
 * This file is part of project EHRbase
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.ehrbase.dao.access.interfaces;

import org.ehrbase.api.definitions.FhirTsProps;
import org.ehrbase.api.service.TerminologyServer;
import org.ehrbase.service.FhirTerminologyServerR4AdaptorImpl;

/*
 * Copyright (c) 2020 Vitasystems GmbH, Hannover Medical School, and Luis Marco-Ruiz (Hannover Medical School).
 *
 * This file is part of project EHRbase
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/***
 *@Created by Luis Marco-Ruiz on Mar 6, 2020
 *
 * @param <DvCodedText> concept type
 * @param <ID> id type
 */
public interface I_OpenehrTerminologyServer<DvCodedText, ID> extends TerminologyServer<DvCodedText, ID> {

/**
 * Create new instance of the external terminology server adaptor.
 * @param <DvCodedText>
 * @param <ID>
 * @param props Configuration properties for the external terminology server adaptor.
 * @return
 * @throws Exception 
 */
    static  <DvCodedText, ID> I_OpenehrTerminologyServer<DvCodedText, String> getInstance(final FhirTsProps props, final String adapterId) throws Exception {
    	if(TerminologyServer.TerminologyAdapter.isAdapterSupported(adapterId)) {
    		throw new Exception("Terminology adapter not supported exception: "+adapterId);
    	}
    	//Cast is correct because of the fixed parameterization of generics in FhirTerminologyServerAdaptorImpl
    	@SuppressWarnings("unchecked")
		I_OpenehrTerminologyServer<DvCodedText, String> result = (I_OpenehrTerminologyServer<DvCodedText, String>) FhirTerminologyServerR4AdaptorImpl.getInstance(props);
        return result;
    }
}
