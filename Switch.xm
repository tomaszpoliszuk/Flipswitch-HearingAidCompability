#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface HearingAidCompabilitySwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSHearingAidComplianceEnabled();
extern "C" void _AXSHearingAidComplianceSetEnabled(BOOL);

@implementation HearingAidCompabilitySwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSHearingAidComplianceEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSHearingAidComplianceSetEnabled(newState == FSSwitchStateOn);
}

@end
