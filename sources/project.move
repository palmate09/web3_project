module MyModule::AcademicAttestation{

    use aptos_framework::signer;
    use std::string::String;

    /// Struct representing an academic attestation
    struct Attestation has key {
        reference: String,      // Reference or recommender name
        publication: String,    // Publication title or detail
    }

    /// Function to create a new attestation
    public entry fun create_attestation(account: &signer, reference: String, publication: String) {
        let attestation = Attestation {
            reference,
            publication,
        };
        move_to(account, attestation);
    }

    /// Function to read an attestation by account
    public fun get_attestation(owner: address): (String, String) acquires Attestation {
        let attestation = borrow_global<Attestation>(owner);
        (attestation.reference, attestation.publication)
    }
    
}
