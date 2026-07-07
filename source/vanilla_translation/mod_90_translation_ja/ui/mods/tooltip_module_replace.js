"use strict";

/*
 Replace place holder texts in the translated strings.
*/
(function(){
	var Const = {
		UI: {
			Color: {
				PositiveValue: "#135213",
				NegativeValue: "#8f1e1e",
				DamageValue: "#8f1e1e",
				PositiveEventValue: "#1e861e",
				NegativeEventValue: "#a22424"
			}
		} 
	};

	for(var key in translation) {
		var value = translation[key];
		if (value[1]) {
			value[1] = value[1].replace(/\$\{Const.UI.Color.PositiveValue\}/g, Const.UI.Color.PositiveValue);
			value[1] = value[1].replace(/\$\{Const.UI.Color.NegativeValue\}/g, Const.UI.Color.NegativeValue);
		}
	}

	for(var key in translation_tooltip2) {
		var value = translation_tooltip2[key];
		if (value["text"] !== undefined) {
			value["text"] = value["text"].replace(/\$\{Const.UI.Color.PositiveValue\}/g, Const.UI.Color.PositiveValue);
			value["text"] = value["text"].replace(/\$\{Const.UI.Color.NegativeValue\}/g, Const.UI.Color.NegativeValue);
		};
		
		var props = ["texts", "descriptions", "options"];
		for (var j = 0; j < props.length; j++) {
			var prop = props[j];
			if (value[prop] !== undefined) {
				for (var i = 0; i < value[prop].length; i++) {
					value[prop][i].t = value[prop][i].t.replace(/\$\{Const.UI.Color.PositiveValue\}/g, Const.UI.Color.PositiveValue);
					value[prop][i].t = value[prop][i].t.replace(/\$\{Const.UI.Color.NegativeValue\}/g, Const.UI.Color.NegativeValue);
					value[prop][i].b = value[prop][i].b.replace(/\$\{Const.UI.Color.PositiveValue\}/g, Const.UI.Color.PositiveValue);
					value[prop][i].b = value[prop][i].b.replace(/\$\{Const.UI.Color.NegativeValue\}/g, Const.UI.Color.NegativeValue);
				}
			}
		};
	}
})();


/*
 Replace tooltip function to inject translation functions.
*/
TooltipModule.prototype.showTooltip = function(_targetDIV, _data)
{
	// clear timer
	if (this.mShowUITooltipTimer)
	{
		this.mShowUITooltipTimer = clearTimeout(this.mShowUITooltipTimer);
	}

	//console.log('#1 show ui tooltip. InDOM: ' + _targetDIV.isInDOM());

	// #2 sanity check
/* TODO: _targetDIV hat die funktion isInDOM() ned ?!
	if (!_targetDIV.isInDOM())
	{
		console.log('ERROR: Target UI element is not within the DOM.');
		// clean up
		this.mCurrentData    = null;
		this.mCurrentElement = null;
		return;
	}
*/
    // check if the tooltip is enabled for this particular element
    var isEnabled = _targetDIV.data('is-enabled');
    if (isEnabled !== null && isEnabled === false)
    {
        return;
    }

    // get tooltip data
    var self = this;
    this.notifyBackendQueryTooltipData(_data, function (tooltipData)
    {
        if (tooltipData === undefined || tooltipData === null)
        {
            console.log('ERROR: Failed to query Tooltip data. Reason: Data is not valid.');
            return;
        }
        
        //Insert TOOLTIP Translation Start
        var translationId;
        var replaceFrom;
		if (_data.contentType == 'ui-element') {
			translationId = _data.elementId;
		//} else if (_data.contentType == 'ui-perk') { //Perk data should be replaced by hook.
		//	translationId = _data.perkId;
		} else if (_data.contentType == 'skill') {
			translationId = _data.skillId;
		//} else if (_data.contentType == 'ui-item') {
		//	translationId = tooltipData[0].baseItemId;
		} else if (_data.contentType == 'status-effect' || _data.contentType == 'settlement-status-effect') {
			translationId = _data.statusEffectId;
			if (_data.statusEffectId == "special.mood_check") {
				translationId = tooltipData[0].moodId;
				replaceFrom = [tooltipData[0].moodStateName, ""];
			}
		}
		
		if (translation[translationId] !== undefined) {
			for (var i = 0; i < tooltipData.length; i++) {
				if (translation[translationId][i] !== undefined && translation[translationId][i] != "") {
					if (replaceFrom !== undefined && replaceFrom[i] != "") {
						tooltipData[i].text = tooltipData[i].text.replace(replaceFrom[i], translation[translationId][i]);
					} else {
						tooltipData[i].text = translation[translationId][i];
					}
				}
			}
		}
		if (translation_tooltip2[translationId] !== undefined) {
			var item = translation_tooltip2[translationId];
			if (item.text != "" && item.text !== undefined) {
				tooltipData[0].text = item.text;
			}
			if (item.texts !== undefined && tooltipData.length >= 0) {
				if (tooltipData[0].text !== undefined) {
					for (var i = 0; i < item.texts.length; i++) {
						var t = item.texts[i];
						if (t.b != "" && t.t !== undefined) {
							tooltipData[0].text = tooltipData[0].text.replace(t.b, t.t);
						}
					}
				}
			}
			if (item.descriptions !== undefined && tooltipData.length >= 1) {
				if (tooltipData[1].text !== undefined) {
					for (var i = 0; i < item.descriptions.length; i++) {
						var t = item.descriptions[i];
						if (t.b != "" && t.t !== undefined) {
							tooltipData[1].text = tooltipData[1].text.replace(t.b, t.t);
						}
					}
				}
			}
			if (item.options !== undefined && tooltipData.length >= 2) {
				for (var j = 2; j < tooltipData.length; j++) {
					if (tooltipData[j] !== undefined && tooltipData[j].text !== undefined) {
						for (var i = 0; i < item.options.length; i++) {
							var t = item.options[i];
							if (t.b != "" && t.t !== undefined) {
								tooltipData[j].text = tooltipData[j].text.replace(t.b, t.t);
							}
						}
					}
				}
			}
		}
        //Insert TOOLTIP Translation End

        self.mIsVisible = true;
        self.mCurrentData = _data;
        self.mCurrentElement = _targetDIV;

        // setup tooltip div
        self.buildFromData(tooltipData, false, _data.contentType);
        self.setupUITooltip(_targetDIV, _data);
    });   
};
