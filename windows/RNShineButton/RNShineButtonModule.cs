using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Shine.Button.RNShineButton
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNShineButtonModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNShineButtonModule"/>.
        /// </summary>
        internal RNShineButtonModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNShineButton";
            }
        }
    }
}
