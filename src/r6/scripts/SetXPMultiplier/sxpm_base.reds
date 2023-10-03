module SetXPMult.Base

public class SXPM extends IScriptable {
	private let player: ref<PlayerPuppet>;
	private let settings: SXPMDefaultSettings;

	public func Setup() -> Void {
        // ------ Settings Start ------
        // Multiplier for character level experience.
		// Default = 1.0
		this.settings.levelXPMultiplier = 1.0;

		// Multiplier for street cred experience.
		// Default = 1.0
		this.settings.streetCredXPMultiplier = 1.0;

		this.settings.headhunterSkillXPMultiplier = 1.0; // Headhunter multiplier
		this.settings.netrunnerSkillXPMultiplier = 1.0; // Netrunner multiplier
		this.settings.shinobiSkillXPMultiplier = 1.0; // Shinobi multiplier
		this.settings.soloSkillXPMultiplier = 1.0; // Solo multiplier
		this.settings.engineerSkillXPMultiplier = 1.0; // Engineer multiplier

		// ------ Settings End ------
    }

	public func GetModifiedExperienceAmount(type: gamedataProficiencyType, vanillaAmount: Int32) -> Int32 {
		let newAmount: Int32;
		let multiplier: Float;

		multiplier = this.GetMultiplier(type);
        newAmount = Cast<Int32>(Cast<Float>(vanillaAmount) * multiplier);

		if newAmount < 0 {
			return vanillaAmount;
		}

        return newAmount;
    }

	protected func GetMultiplier(type: gamedataProficiencyType) -> Float {
		switch type {
            case gamedataProficiencyType.Level:
                return this.settings.levelXPMultiplier;
            case gamedataProficiencyType.StreetCred:
                return this.settings.streetCredXPMultiplier;
            case gamedataProficiencyType.CoolSkill:
                return this.settings.headhunterSkillXPMultiplier;
			case gamedataProficiencyType.IntelligenceSkill:
                return this.settings.netrunnerSkillXPMultiplier;
            case gamedataProficiencyType.ReflexesSkill:
                return this.settings.shinobiSkillXPMultiplier;
			case gamedataProficiencyType.StrengthSkill:
                return this.settings.soloSkillXPMultiplier;
			case gamedataProficiencyType.TechnicalAbilitySkill:
                return this.settings.engineerSkillXPMultiplier;

			default:
                return 1.0;
		}
	}

	public func GetIsEnabled() -> Bool {
        return true;
    }
}

struct SXPMDefaultSettings {
    public let levelXPMultiplier: Float;
	public let streetCredXPMultiplier: Float;
    public let headhunterSkillXPMultiplier: Float;
    public let netrunnerSkillXPMultiplier: Float;
    public let shinobiSkillXPMultiplier: Float;
    public let soloSkillXPMultiplier: Float;
    public let engineerSkillXPMultiplier: Float;
}
