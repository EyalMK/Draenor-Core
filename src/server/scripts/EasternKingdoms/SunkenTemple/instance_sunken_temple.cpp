#include "ScriptPCH.h"
#include "sunken_temple.h"

#define EVENT_HAKKAR 8502 // eventId from spell 'Awaken the Soulflayer' 12346

const Position hakkarPos = { -466.44f, 271.95f, -90.0f, 0.0f };

class instance_sunken_temple : public InstanceMapScript
{
public:
	instance_sunken_temple() : InstanceMapScript("instance_sunken_temple", 109) { }

	InstanceScript* GetInstanceScript(InstanceMap* map) const
	{
		return new instance_sunken_temple_InstanceMapScript(map);
	}

	struct instance_sunken_temple_InstanceMapScript : public InstanceScript
	{
		instance_sunken_temple_InstanceMapScript(Map* map) : InstanceScript(map)
		{
			eventHakkar = NOT_STARTED;
		}

		void SetData(uint32 type, uint32 data)
		{
			if (type == DATA_HAKKAR_EVENT)
			{
				eventHakkar = data;
			}
		}

		uint32 GetData(uint32 type)
		{
			if (type == DATA_HAKKAR_EVENT)
				return eventHakkar;

			return 0;
		}

		void ProcessEvent(WorldObject* /*source*/, uint32 eventId)
		{
			if (eventId == EVENT_HAKKAR && eventHakkar == NOT_STARTED)
			{
				eventHakkar = DONE;

				instance->SummonCreature(NPC_AVATAR_OF_HAKKAR, hakkarPos);
			}
		}

	private:

		uint32 eventHakkar;
	};
};

void AddSC_instance_sunken_temple()
{
	new instance_sunken_temple();
}
