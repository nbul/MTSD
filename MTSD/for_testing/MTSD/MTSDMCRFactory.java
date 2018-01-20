/*
 * MATLAB Compiler: 6.5 (R2017b)
 * Date: Sat Jan 20 19:01:12 2018
 * Arguments: 
 * "-B""macro_default""-W""java:MTSD,Class1""-T""link:lib""-d""/Users/nataliabulgakova/Documents/MATLAB/MTSD/MTSD/for_testing""class{Class1:/Users/nataliabulgakova/Documents/MATLAB/MTSD/MTSDfunction.m}"
 */

package MTSD;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class MTSDMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "MTSD_0A60D6A5367BF0C3E39387ACB0C4190C";
    
    /** Component name */
    private static final String sComponentName = "MTSD";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(MTSDMCRFactory.class)
        );
    
    
    private MTSDMCRFactory()
    {
        // Never called.
    }
    
    public static MWMCR newInstance(MWComponentOptions componentOptions) throws MWException
    {
        if (null == componentOptions.getCtfSource()) {
            componentOptions = new MWComponentOptions(componentOptions);
            componentOptions.setCtfSource(sDefaultComponentOptions.getCtfSource());
        }
        return MWMCR.newInstance(
            componentOptions, 
            MTSDMCRFactory.class, 
            sComponentName, 
            sComponentId,
            new int[]{9,3,0}
        );
    }
    
    public static MWMCR newInstance() throws MWException
    {
        return newInstance(sDefaultComponentOptions);
    }
}
