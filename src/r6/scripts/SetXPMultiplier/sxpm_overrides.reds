module SetXPMult.Overrides
import SetXPMult.Base.SXPM

@if(ModuleExists("ModSettingsModule"))
import SetXPMult.Menu.SXPMWithMenu

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

@if(ModuleExists("ModSettingsModule"))
@addMethod(PlayerDevelopmentSystem)
private func SXPM_Initialize() -> Void {
    this.sxpm = new SXPMWithMenu();
}

@if(!ModuleExists("ModSettingsModule"))
@addMethod(PlayerDevelopmentSystem)
private func SXPM_Initialize() -> Void {
    this.sxpm = new SXPM();
}