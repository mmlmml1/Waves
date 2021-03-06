import Foundation
import SceneKit
import UIKit

public class FixedWaveScene: FixedForkScene {
    internal var oss:Oscilloscope<WaveFormDecreasing>? = nil
    public var waves = [Wave(amplitude: 50, waveLength: 5, frequency: 0.5)]
    
    override internal func addWavesToOss(index:Int = 0) {
        self.removeWavesFromOss(index: index)
        let wave = self.waves[index].mutableCopy() as! Wave
        self.waves[index] = wave
        oss!.waveform.addWave(wave)
    }
    
    override internal func removeWavesFromOss(index:Int = 0) {
        oss!.waveform.removeWave(self.waves[index].id)
    }
    
    override internal func setUpAdditionalView(_ frame: CGRect) {
        oss = Oscilloscope<WaveFormDecreasing>(size: CGSize(width: frame.width, height: frame.height))
        let view = self.view as! SCNView
        view.overlaySKScene = oss
    }
}
