//
//  AcquisitionContext.swift
//  UIImage+Spectrogram
//
//  Created by AL on 03/09/2018.
//  Copyright © 2018 Alban. All rights reserved.
//

import Foundation

public class AcquisitionContext {
    
    public var fftSize:Int
    public var sampleRate:Float

    public init(fftSize: Int, sampleRate: Float) {
        self.fftSize = fftSize
        self.sampleRate = sampleRate
    }
    
    public func frequencyStepForIndex(_ index:Int) -> Float {
        return Float(index)*sampleRate / Float(fftSize)
    }
    
    public func indexForFrequency(_ targetFreq:Float) -> Int {
        var index = 0
        for i in 0...Int(fftSize) {
            index = i
            let freq = frequencyStepForIndex(i)
            if freq >= targetFreq {
                return index
            }
        }
        return index
    }
    
    public func durationInfosForSamples(_ samples:[Float]) -> (totalDuration:Float,chunkDuration:Float) {
        let chunkDuration = (1.0/(sampleRate/Float(fftSize)))
        let totalDuration = Float(samples.count)/sampleRate
        return (totalDuration,chunkDuration)
    }

}
