module SetXPMult.Overrides
import SetXPMult.Base.SXPM

@addField(PlayerDevelopmentSystem)
private let sxpm: ref<SXPM>;

@wrapMethod(PlayerDevelopmentSystem)
private func OnExperienceAdded(request: ref<AddExperience>) -> Void {
    let newAmount: Int32;

    if !IsDefined(this.sxpm) {
        this.SXPM_Initialize();
        this.sxpm.Setup();
    }

    if this.sxpm.GetIsEnabled() {
        newAmount = this.sxpm.GetModifiedExperienceAmount(request.m_experienceType, request.m_amount);

        request.m_amount = newAmount;
    }

	wrappedMethod(request);
}

@addMethod(PlayerDevelopmentSystem)
private func SXPM_Initialize() -> Void {
    this.sxpm = new SXPM();
}