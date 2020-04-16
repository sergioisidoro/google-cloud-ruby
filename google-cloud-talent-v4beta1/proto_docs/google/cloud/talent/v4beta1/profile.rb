# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module Talent
      module V4beta1
        # A resource that represents the profile for a job candidate (also referred to
        # as a "single-source profile").
        # @!attribute [rw] name
        #   @return [String]
        #     Required during profile update.
        #
        #     Resource name assigned to a profile by the API.
        #
        #     The format is
        #     "projects/\\{project_id}/tenants/\\{tenant_id}/profiles/\\{profile_id}",
        #     for example, "projects/foo/tenants/bar/profiles/baz".
        # @!attribute [rw] external_id
        #   @return [String]
        #     Profile's id in client system, if available. This value is unique for each
        #     profile inside a tenant. An error is thrown if another profile with the
        #     same external_id is created.
        #
        #     The maximum number of bytes allowed is 100.
        # @!attribute [rw] source
        #   @return [String]
        #     The source description indicating where the profile is acquired.
        #
        #     For example, if a candidate profile is acquired from a resume, the user can
        #     input "resume" here to indicate the source.
        #
        #     The maximum number of bytes allowed is 100.
        # @!attribute [rw] uri
        #   @return [String]
        #     The URI set by clients that links to this profile's client-side copy.
        #
        #     The maximum number of bytes allowed is 4000.
        # @!attribute [rw] group_id
        #   @return [String]
        #     The cluster id of the profile to associate with other profile(s) for the
        #     same candidate.
        #
        #     This field should be generated by the customer. If a value is not provided,
        #     a random UUID is assigned to this field of the profile.
        #
        #     This is used to link multiple profiles to the same candidate. For example,
        #     a client has a candidate with two profiles, where one was created recently
        #     and the other one was created 5 years ago. These two profiles may be very
        #     different. The clients can create the first profile and get a generated
        #     {Google::Cloud::Talent::V4beta1::Profile#group_id group_id}, and assign it when the second profile is created,
        #     indicating these two profiles are referring to the same candidate.
        # @!attribute [rw] is_hirable
        #   @return [Google::Protobuf::BoolValue]
        #     Indicates the hirable status of the candidate.
        # @!attribute [rw] create_time
        #   @return [Google::Protobuf::Timestamp]
        #     The timestamp when the profile was first created at this source.
        # @!attribute [rw] update_time
        #   @return [Google::Protobuf::Timestamp]
        #     The timestamp when the profile was last updated at this source.
        # @!attribute [rw] candidate_update_time
        #   @return [Google::Protobuf::Timestamp]
        #     The timestamp when the profile was last updated as a result of a direct or
        #     indirect action by a candidate.
        #
        #     These actions include:
        #
        #     * Direct actions such as the candidate submitting a new resume as part of a
        #     job application to the agency, using a self-service tool such as a website
        #     to update their profile, and so on.
        #     * Indirect actions by the candidate such as uploading a resume to a job
        #     board that is collected by the agency through a feed, providing a resume to
        #     a recruiter who then uploads it into the ATS, and so on.
        #     * Updates made to the candidate's profile by the recruiter as a result of
        #     interacting with the candidate (for example adding a skill or work
        #     preference, and so on). Changes to [recruiting_notes][google.cloud.talent.v4beta1.Profile.recruiting_notes] are specifically
        #     excluded from this action type.
        #
        #     Note: {Google::Cloud::Talent::V4beta1::Profile#candidate_update_time candidate_update_time} must be greater than or equal to
        #     {Google::Cloud::Talent::V4beta1::Profile#resume_update_time resume_update_time} or an error is thrown.
        # @!attribute [rw] resume_update_time
        #   @return [Google::Protobuf::Timestamp]
        #     The timestamp when the candidate's resume was added or updated on the
        #     candidate's profile. Whether that resume was directly uploaded by a
        #     candidate, pulled from a 3rd party job board feed, added by a recruiter,
        #     and so on.
        #
        #     If this field is updated, it's expected that {Google::Cloud::Talent::V4beta1::Profile#resume resume} is provided in
        #     the create or update calls.
        # @!attribute [rw] resume
        #   @return [Google::Cloud::Talent::V4beta1::Resume]
        #     The resume representing this profile.
        # @!attribute [rw] person_names
        #   @return [Array<Google::Cloud::Talent::V4beta1::PersonName>]
        #     The names of the candidate this profile references.
        #
        #     Currently only one person name is supported.
        # @!attribute [rw] addresses
        #   @return [Array<Google::Cloud::Talent::V4beta1::Address>]
        #     The candidate's postal addresses. It's highly recommended to
        #     input this information as accurately as possible to help improve search
        #     quality. Here are some recommendations:
        #
        #     * Provide {Google::Cloud::Talent::V4beta1::Address#usage Address.usage} if possible, especially if the address is
        #     PERSONAL. During a search only personal addresses are considered. If there
        #     is no such address, all addresses with unspecified usage are assumed to be
        #     personal.
        #     * Provide {Google::Cloud::Talent::V4beta1::Address#current Address.current} for the current address if possible. During
        #     a search, only current addresses are considered. If there is no such
        #     address, all addresses are assumed to be current.
        #
        #     When displaying a candidate's addresses, it is sometimes desirable to limit
        #     the number of addresses shown. In these cases we recommend that you display
        #     the addresses in the following order of priority:
        #     1. {Google::Cloud::Talent::V4beta1::Address#usage Address.usage} is PERSONAL and {Google::Cloud::Talent::V4beta1::Address#current Address.current} is true.
        #     2. {Google::Cloud::Talent::V4beta1::Address#usage Address.usage} is PERSONAL and {Google::Cloud::Talent::V4beta1::Address#current Address.current} is false or not
        #     set.
        #     3. {Google::Cloud::Talent::V4beta1::Address#usage Address.usage} is CONTACT_INFO_USAGE_UNSPECIFIED and
        #     {Google::Cloud::Talent::V4beta1::Address#current Address.current} is true.
        #     4. {Google::Cloud::Talent::V4beta1::Address#usage Address.usage} is CONTACT_INFO_USAGE_UNSPECIFIED and
        #     {Google::Cloud::Talent::V4beta1::Address#current Address.current} is false or not set.
        # @!attribute [rw] email_addresses
        #   @return [Array<Google::Cloud::Talent::V4beta1::Email>]
        #     The candidate's email addresses.
        # @!attribute [rw] phone_numbers
        #   @return [Array<Google::Cloud::Talent::V4beta1::Phone>]
        #     The candidate's phone number(s).
        # @!attribute [rw] personal_uris
        #   @return [Array<Google::Cloud::Talent::V4beta1::PersonalUri>]
        #     The candidate's personal URIs.
        # @!attribute [rw] additional_contact_info
        #   @return [Array<Google::Cloud::Talent::V4beta1::AdditionalContactInfo>]
        #     Available contact information besides {Google::Cloud::Talent::V4beta1::Profile#addresses addresses}, {Google::Cloud::Talent::V4beta1::Profile#email_addresses email_addresses},
        #     {Google::Cloud::Talent::V4beta1::Profile#phone_numbers phone_numbers} and {Google::Cloud::Talent::V4beta1::Profile#personal_uris personal_uris}. For example, Hang-out, Skype.
        # @!attribute [rw] employment_records
        #   @return [Array<Google::Cloud::Talent::V4beta1::EmploymentRecord>]
        #     The employment history records of the candidate. It's highly recommended
        #     to input this information as accurately as possible to help improve search
        #     quality. Here are some recommendations:
        #
        #     * Specify the start and end dates of the employment records.
        #     * List different employment types separately, no matter how minor the
        #     change is.
        #     For example, only job title is changed from "software engineer" to "senior
        #     software engineer".
        #     * Provide {Google::Cloud::Talent::V4beta1::EmploymentRecord#is_current EmploymentRecord.is_current} for the current employment if
        #     possible. If not, it's inferred from user inputs.
        #
        #     The limitation for max number of employment records is 100.
        # @!attribute [rw] education_records
        #   @return [Array<Google::Cloud::Talent::V4beta1::EducationRecord>]
        #     The education history record of the candidate. It's highly recommended to
        #     input this information as accurately as possible to help improve search
        #     quality. Here are some recommendations:
        #
        #     * Specify the start and end dates of the education records.
        #     * List each education type separately, no matter how minor the change is.
        #     For example, the profile contains the education experience from the same
        #     school but different degrees.
        #     * Provide {Google::Cloud::Talent::V4beta1::EducationRecord#is_current EducationRecord.is_current} for the current education if
        #     possible. If not, it's inferred from user inputs.
        #
        #     The limitation for max number of education records is 100.
        # @!attribute [rw] skills
        #   @return [Array<Google::Cloud::Talent::V4beta1::Skill>]
        #     The skill set of the candidate. It's highly recommended to provide as
        #     much information as possible to help improve the search quality.
        #
        #     The limitation for max number of skills is 500.
        # @!attribute [rw] activities
        #   @return [Array<Google::Cloud::Talent::V4beta1::Activity>]
        #     The individual or collaborative activities which the candidate has
        #     participated in, for example, open-source projects, class assignments that
        #     aren't listed in {Google::Cloud::Talent::V4beta1::Profile#employment_records employment_records}.
        #
        #     The limitation for max number of activities is 50.
        # @!attribute [rw] publications
        #   @return [Array<Google::Cloud::Talent::V4beta1::Publication>]
        #     The publications published by the candidate.
        #
        #     The limitation for max number of publications is 50.
        # @!attribute [rw] patents
        #   @return [Array<Google::Cloud::Talent::V4beta1::Patent>]
        #     The patents acquired by the candidate.
        # @!attribute [rw] certifications
        #   @return [Array<Google::Cloud::Talent::V4beta1::Certification>]
        #     The certifications acquired by the candidate.
        # @!attribute [r] applications
        #   @return [Array<String>]
        #     Output only. The resource names of the candidate's applications.
        # @!attribute [r] assignments
        #   @return [Array<String>]
        #     Output only. The resource names of the candidate's assignments.
        # @!attribute [rw] custom_attributes
        #   @return [Google::Protobuf::Map{String => Google::Cloud::Talent::V4beta1::CustomAttribute}]
        #     A map of fields to hold both filterable and non-filterable custom profile
        #     attributes that aren't covered by the provided structured fields. See
        #     {Google::Cloud::Talent::V4beta1::CustomAttribute CustomAttribute} for more details.
        #
        #     At most 100 filterable and at most 100 unfilterable keys are supported. If
        #     limit is exceeded, an error is thrown. Custom attributes are `unfilterable`
        #     by default. These are filterable when the `filterable` flag is set to
        #     `true`.
        #
        #     Numeric custom attributes: each key can only map to one numeric value,
        #     otherwise an error is thrown. Client can also filter on numeric custom
        #     attributes using '>', '<' or '=' operators.
        #
        #     String custom attributes: each key can map up to 50 string values. For
        #     filterable string value, each value has a byte size of no more than 256B.
        #     For unfilterable string values, the maximum byte size of a single key is
        #     64B. An error is thrown for any request exceeding the limit.
        #     The maximum total byte size is 10KB.
        # @!attribute [r] processed
        #   @return [Boolean]
        #     Output only. Indicates if a summarized profile was created as part of the
        #     profile creation API call. This flag does not indicate whether a profile is
        #     searchable or not.
        # @!attribute [r] keyword_snippet
        #   @return [String]
        #     Output only. Keyword snippet shows how the search result is related to a
        #     search query.  This is only returned in {Google::Cloud::Talent::V4beta1::SearchProfilesResponse SearchProfilesResponse}.
        # @!attribute [r] availability_signals
        #   @return [Array<Google::Cloud::Talent::V4beta1::AvailabilitySignal>]
        #     Output only. Candidate's availability signals.
        # @!attribute [r] derived_addresses
        #   @return [Array<Google::Cloud::Talent::V4beta1::Location>]
        #     Output only. Derived locations of the profile, resolved from {Google::Cloud::Talent::V4beta1::Profile#addresses Profile.addresses}.
        #
        #     {Google::Cloud::Talent::V4beta1::Profile#derived_addresses derived_addresses} are exactly matched to {Google::Cloud::Talent::V4beta1::Profile#addresses Profile.addresses} in the
        #     same order.
        class Profile
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods

          # @!attribute [rw] key
          #   @return [String]
          # @!attribute [rw] value
          #   @return [Google::Cloud::Talent::V4beta1::CustomAttribute]
          class CustomAttributesEntry
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # Candidate availability signal.
        # @!attribute [rw] type
        #   @return [Google::Cloud::Talent::V4beta1::AvailabilitySignalType]
        #     Type of signal.
        # @!attribute [rw] last_update_time
        #   @return [Google::Protobuf::Timestamp]
        #     Timestamp of when the given availability activity last happened.
        # @!attribute [rw] filter_satisfied
        #   @return [Google::Protobuf::BoolValue]
        #     Indicates if the {Google::Cloud::Talent::V4beta1::AvailabilitySignal#last_update_time last_update_time} is within
        #     {Google::Cloud::Talent::V4beta1::AvailabilityFilter#range AvailabilityFilter.range}.
        #
        #     Returned only in a search response when there is an {Google::Cloud::Talent::V4beta1::AvailabilityFilter AvailabilityFilter}
        #     in {Google::Cloud::Talent::V4beta1::ProfileQuery#availability_filters ProfileQuery.availability_filters} where
        #     {Google::Cloud::Talent::V4beta1::AvailabilityFilter#signal_type signal_type} matches {Google::Cloud::Talent::V4beta1::AvailabilitySignal#type type}.
        class AvailabilitySignal
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents a resume.
        # @!attribute [rw] structured_resume
        #   @return [String]
        #     Users can create a profile with only this field field, if {Google::Cloud::Talent::V4beta1::Resume#resume_type resume_type}
        #     is {Google::Cloud::Talent::V4beta1::Resume::ResumeType::HRXML HRXML}. For example, the API parses this field and
        #     creates a profile
        #     with all structured fields populated. {Google::Cloud::Talent::V4beta1::EmploymentRecord EmploymentRecord},
        #     {Google::Cloud::Talent::V4beta1::EducationRecord EducationRecord}, and so on. An error is thrown if this field cannot be
        #     parsed.
        #
        #     Note that the use of the functionality offered by this field to extract
        #     data from resumes is an Alpha feature and as such is not covered by any
        #     SLA.
        # @!attribute [rw] resume_type
        #   @return [Google::Cloud::Talent::V4beta1::Resume::ResumeType]
        #     The format of {Google::Cloud::Talent::V4beta1::Resume#structured_resume structured_resume}.
        class Resume
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods

          # The format of a structured resume.
          module ResumeType
            # Default value.
            RESUME_TYPE_UNSPECIFIED = 0

            # The profile contents in HR-XML format.
            # See https://schemas.liquid-technologies.com/hr-xml/2007-04-15/ for more
            # information about Human Resources XML.
            HRXML = 1

            # Resume type not specified.
            OTHER_RESUME_TYPE = 2
          end
        end

        # Resource that represents the name of a person.
        # @!attribute [rw] formatted_name
        #   @return [String]
        #     A string represents a person's full name. For example, "Dr. John Smith".
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] structured_name
        #   @return [Google::Cloud::Talent::V4beta1::PersonName::PersonStructuredName]
        #     A person's name in a structured way (last name, first name, suffix, and
        #     so on.)
        # @!attribute [rw] preferred_name
        #   @return [String]
        #     Preferred name for the person. This field is ignored if {Google::Cloud::Talent::V4beta1::PersonName#structured_name structured_name}
        #     is provided.
        #
        #     Number of characters allowed is 100.
        class PersonName
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods

          # Resource that represents a person's structured name.
          # @!attribute [rw] given_name
          #   @return [String]
          #     Given/first name.
          #
          #     It's derived from {Google::Cloud::Talent::V4beta1::PersonName#formatted_name formatted_name} if not provided.
          #
          #     Number of characters allowed is 100.
          # @!attribute [rw] preferred_name
          #   @return [String]
          #     Preferred given/first name or nickname.
          #
          #     Number of characters allowed is 100.
          # @!attribute [rw] middle_initial
          #   @return [String]
          #     Middle initial.
          #
          #     It's derived from {Google::Cloud::Talent::V4beta1::PersonName#formatted_name formatted_name} if not provided.
          #
          #     Number of characters allowed is 20.
          # @!attribute [rw] family_name
          #   @return [String]
          #     Family/last name.
          #
          #     It's derived from {Google::Cloud::Talent::V4beta1::PersonName#formatted_name formatted_name} if not provided.
          #
          #     Number of characters allowed is 100.
          # @!attribute [rw] suffixes
          #   @return [Array<String>]
          #     Suffixes.
          #
          #     Number of characters allowed is 20.
          # @!attribute [rw] prefixes
          #   @return [Array<String>]
          #     Prefixes.
          #
          #     Number of characters allowed is 20.
          class PersonStructuredName
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # Resource that represents a address.
        # @!attribute [rw] usage
        #   @return [Google::Cloud::Talent::V4beta1::ContactInfoUsage]
        #     The usage of the address. For example, SCHOOL, WORK, PERSONAL.
        # @!attribute [rw] unstructured_address
        #   @return [String]
        #     Unstructured address.
        #
        #     For example, "1600 Amphitheatre Pkwy, Mountain View, CA 94043",
        #     "Sunnyvale, California".
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] structured_address
        #   @return [Google::Type::PostalAddress]
        #     Structured address that contains street address, city, state, country,
        #     and so on.
        # @!attribute [rw] current
        #   @return [Google::Protobuf::BoolValue]
        #     Indicates if it's the person's current address.
        class Address
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents a person's email address.
        # @!attribute [rw] usage
        #   @return [Google::Cloud::Talent::V4beta1::ContactInfoUsage]
        #     The usage of the email address. For example, SCHOOL, WORK, PERSONAL.
        # @!attribute [rw] email_address
        #   @return [String]
        #     Email address.
        #
        #     Number of characters allowed is 4,000.
        class Email
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents a person's telephone number.
        # @!attribute [rw] usage
        #   @return [Google::Cloud::Talent::V4beta1::ContactInfoUsage]
        #     The usage of the phone. For example, SCHOOL, WORK, PERSONAL.
        # @!attribute [rw] type
        #   @return [Google::Cloud::Talent::V4beta1::Phone::PhoneType]
        #     The phone type. For example, LANDLINE, MOBILE, FAX.
        # @!attribute [rw] number
        #   @return [String]
        #     Phone number.
        #
        #     Any phone formats are supported and only exact matches are performed on
        #     searches. For example, if a phone number in profile is provided in the
        #     format of "(xxx)xxx-xxxx", in profile searches the same phone format
        #     has to be provided.
        #
        #     Number of characters allowed is 20.
        # @!attribute [rw] when_available
        #   @return [String]
        #     When this number is available. Any descriptive string is expected.
        #
        #     Number of characters allowed is 100.
        class Phone
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods

          # Enum that represents the type of the telephone.
          module PhoneType
            # Default value.
            PHONE_TYPE_UNSPECIFIED = 0

            # A landline.
            LANDLINE = 1

            # A mobile.
            MOBILE = 2

            # A fax.
            FAX = 3

            # A pager.
            PAGER = 4

            # A TTY (test telephone) or TDD (telecommunication device for the deaf).
            TTY_OR_TDD = 5

            # A voicemail.
            VOICEMAIL = 6

            # A virtual telephone number is a number that can be routed to another
            # number and managed by the user via Web, SMS, IVR, and so on.  It is
            # associated with a particular person, and may be routed to either a MOBILE
            # or LANDLINE number. The [phone usage][google.cloud.talent.v4beta1.ContactInfoUsage] should
            # be set to PERSONAL for these phone types. Some more information can be
            # found here: https://en.wikipedia.org/wiki/Personal_Numbers
            VIRTUAL = 7

            # Voice over IP numbers. This includes TSoIP (Telephony Service over IP).
            VOIP = 8

            # In some regions (e.g. the USA), it is impossible to distinguish between
            # fixed-line and mobile numbers by looking at the phone number itself.
            MOBILE_OR_LANDLINE = 9
          end
        end

        # Resource that represents a valid URI for a personal use.
        # @!attribute [rw] uri
        #   @return [String]
        #     The personal URI.
        #
        #     Number of characters allowed is 4,000.
        class PersonalUri
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents contact information other than phone, email,
        # URI and addresses.
        # @!attribute [rw] usage
        #   @return [Google::Cloud::Talent::V4beta1::ContactInfoUsage]
        #     The usage of this contact method. For example, SCHOOL, WORK, PERSONAL.
        # @!attribute [rw] name
        #   @return [String]
        #     The name of the contact method.
        #
        #     For example, "hangout", "skype".
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] contact_id
        #   @return [String]
        #     The contact id.
        #
        #     Number of characters allowed is 100.
        class AdditionalContactInfo
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents an employment record of a candidate.
        # @!attribute [rw] start_date
        #   @return [Google::Type::Date]
        #     Start date of the employment.
        # @!attribute [rw] end_date
        #   @return [Google::Type::Date]
        #     End date of the employment.
        # @!attribute [rw] employer_name
        #   @return [String]
        #     The name of the employer company/organization.
        #
        #     For example, "Google", "Alphabet", and so on.
        #
        #     Number of characters allowed is 250.
        # @!attribute [rw] division_name
        #   @return [String]
        #     The division name of the employment.
        #
        #     For example, division, department, client, and so on.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] address
        #   @return [Google::Cloud::Talent::V4beta1::Address]
        #     The physical address of the employer.
        # @!attribute [rw] job_title
        #   @return [String]
        #     The job title of the employment.
        #
        #     For example, "Software Engineer", "Data Scientist", and so on.
        #
        #     Number of characters allowed is 250.
        # @!attribute [rw] job_description
        #   @return [String]
        #     The description of job content.
        #
        #     Number of characters allowed is 100,000.
        # @!attribute [rw] is_supervisor
        #   @return [Google::Protobuf::BoolValue]
        #     If the jobs is a supervisor position.
        # @!attribute [rw] is_self_employed
        #   @return [Google::Protobuf::BoolValue]
        #     If this employment is self-employed.
        # @!attribute [rw] is_current
        #   @return [Google::Protobuf::BoolValue]
        #     If this employment is current.
        # @!attribute [r] job_title_snippet
        #   @return [String]
        #     Output only. The job title snippet shows how the {Google::Cloud::Talent::V4beta1::EmploymentRecord#job_title job_title} is related
        #     to a search query. It's empty if the {Google::Cloud::Talent::V4beta1::EmploymentRecord#job_title job_title} isn't related to the
        #     search query.
        # @!attribute [r] job_description_snippet
        #   @return [String]
        #     Output only. The job description snippet shows how the {Google::Cloud::Talent::V4beta1::EmploymentRecord#job_description job_description}
        #     is related to a search query. It's empty if the {Google::Cloud::Talent::V4beta1::EmploymentRecord#job_description job_description} isn't
        #     related to the search query.
        # @!attribute [r] employer_name_snippet
        #   @return [String]
        #     Output only. The employer name snippet shows how the {Google::Cloud::Talent::V4beta1::EmploymentRecord#employer_name employer_name} is
        #     related to a search query. It's empty if the {Google::Cloud::Talent::V4beta1::EmploymentRecord#employer_name employer_name} isn't
        #     related to the search query.
        class EmploymentRecord
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents an education record of a candidate.
        # @!attribute [rw] start_date
        #   @return [Google::Type::Date]
        #     The start date of the education.
        # @!attribute [rw] end_date
        #   @return [Google::Type::Date]
        #     The end date of the education.
        # @!attribute [rw] expected_graduation_date
        #   @return [Google::Type::Date]
        #     The expected graduation date if currently pursuing a degree.
        # @!attribute [rw] school_name
        #   @return [String]
        #     The name of the school or institution.
        #
        #     For example, "Stanford University", "UC Berkeley", and so on.
        #
        #     Number of characters allowed is 250.
        # @!attribute [rw] address
        #   @return [Google::Cloud::Talent::V4beta1::Address]
        #     The physical address of the education institution.
        # @!attribute [rw] degree_description
        #   @return [String]
        #     The full description of the degree.
        #
        #     For example, "Master of Science in Computer Science", "B.S in Math".
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] structured_degree
        #   @return [Google::Cloud::Talent::V4beta1::Degree]
        #     The structured notation of the degree.
        # @!attribute [rw] description
        #   @return [String]
        #     The description of the education.
        #
        #     Number of characters allowed is 100,000.
        # @!attribute [rw] is_current
        #   @return [Google::Protobuf::BoolValue]
        #     If this education is current.
        # @!attribute [r] school_name_snippet
        #   @return [String]
        #     Output only. The school name snippet shows how the {Google::Cloud::Talent::V4beta1::EducationRecord#school_name school_name} is related to a
        #     search query in search result. It's empty if the {Google::Cloud::Talent::V4beta1::EducationRecord#school_name school_name} isn't
        #     related to the search query.
        # @!attribute [r] degree_snippet
        #   @return [String]
        #     Output only. The job description snippet shows how the {Google::Cloud::Talent::V4beta1::Degree Degree} is related to a search
        #     query in search result. It's empty if the {Google::Cloud::Talent::V4beta1::Degree Degree} isn't related to the
        #     search query.
        class EducationRecord
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents a degree pursuing or acquired by a candidate.
        # @!attribute [rw] degree_type
        #   @return [Google::Cloud::Talent::V4beta1::DegreeType]
        #     ISCED degree type.
        # @!attribute [rw] degree_name
        #   @return [String]
        #     Full Degree name.
        #
        #     For example, "B.S.", "Master of Arts", and so on.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] fields_of_study
        #   @return [Array<String>]
        #     Fields of study for the degree.
        #
        #     For example, "Computer science", "engineering".
        #
        #     Number of characters allowed is 100.
        class Degree
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents an individual or collaborative activity participated
        # in by a candidate, for example, an open-source project, a class assignment,
        # and so on.
        # @!attribute [rw] display_name
        #   @return [String]
        #     Activity display name.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] description
        #   @return [String]
        #     Activity description.
        #
        #     Number of characters allowed is 100,000.
        # @!attribute [rw] uri
        #   @return [String]
        #     Activity URI.
        #
        #     Number of characters allowed is 4,000.
        # @!attribute [rw] create_date
        #   @return [Google::Type::Date]
        #     The first creation date of the activity.
        # @!attribute [rw] update_date
        #   @return [Google::Type::Date]
        #     The last update date of the activity.
        # @!attribute [rw] team_members
        #   @return [Array<String>]
        #     A list of team members involved in this activity.
        #
        #     Number of characters allowed is 100.
        #
        #     The limitation for max number of team members is 50.
        # @!attribute [rw] skills_used
        #   @return [Array<Google::Cloud::Talent::V4beta1::Skill>]
        #     A list of skills used in this activity.
        #
        #     The limitation for max number of skills used is 50.
        # @!attribute [r] activity_name_snippet
        #   @return [String]
        #     Output only. Activity name snippet shows how the {Google::Cloud::Talent::V4beta1::Activity#display_name display_name} is related to a search
        #     query. It's empty if the {Google::Cloud::Talent::V4beta1::Activity#display_name display_name} isn't related to the search
        #     query.
        # @!attribute [r] activity_description_snippet
        #   @return [String]
        #     Output only. Activity description snippet shows how the
        #     {Google::Cloud::Talent::V4beta1::Activity#description description} is related to a search query. It's empty if the
        #     {Google::Cloud::Talent::V4beta1::Activity#description description} isn't related to the search query.
        # @!attribute [r] skills_used_snippet
        #   @return [Array<String>]
        #     Output only. Skill used snippet shows how the corresponding
        #     {Google::Cloud::Talent::V4beta1::Activity#skills_used skills_used} are related to a search query. It's empty if the
        #     corresponding {Google::Cloud::Talent::V4beta1::Activity#skills_used skills_used} are not related to the search query.
        class Activity
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents a publication resource of a candidate.
        # @!attribute [rw] authors
        #   @return [Array<String>]
        #     A list of author names.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] title
        #   @return [String]
        #     The title of the publication.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] description
        #   @return [String]
        #     The description of the publication.
        #
        #     Number of characters allowed is 100,000.
        # @!attribute [rw] journal
        #   @return [String]
        #     The journal name of the publication.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] volume
        #   @return [String]
        #     Volume number.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] publisher
        #   @return [String]
        #     The publisher of the journal.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] publication_date
        #   @return [Google::Type::Date]
        #     The publication date.
        # @!attribute [rw] publication_type
        #   @return [String]
        #     The publication type.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] isbn
        #   @return [String]
        #     ISBN number.
        #
        #     Number of characters allowed is 100.
        class Publication
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Resource that represents the patent acquired by a candidate.
        # @!attribute [rw] display_name
        #   @return [String]
        #     Name of the patent.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] inventors
        #   @return [Array<String>]
        #     A list of inventors' names.
        #
        #     Number of characters allowed for each is 100.
        # @!attribute [rw] patent_status
        #   @return [String]
        #     The status of the patent.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] patent_status_date
        #   @return [Google::Type::Date]
        #     The date the last time the status of the patent was checked.
        # @!attribute [rw] patent_filing_date
        #   @return [Google::Type::Date]
        #     The date that the patent was filed.
        # @!attribute [rw] patent_office
        #   @return [String]
        #     The name of the patent office.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] patent_number
        #   @return [String]
        #     The number of the patent.
        #
        #     Number of characters allowed is 100.
        # @!attribute [rw] patent_description
        #   @return [String]
        #     The description of the patent.
        #
        #     Number of characters allowed is 100,000.
        # @!attribute [rw] skills_used
        #   @return [Array<Google::Cloud::Talent::V4beta1::Skill>]
        #     The skills used in this patent.
        class Patent
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
