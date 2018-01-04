class ResultHistorysController < ApplicationController
  require 'date'

  def generateTest
    @m_test_type = MTestType.find(params[:typeId])
      
    userId = session[:user_id]
    # resultHistoryを新規作成する
    @result_history = ResultHistory.new
    @result_history.testStartTime = Time.now
    @result_history.testTypeId = @m_test_type.id
    @result_history.userId = userId
    @result_history.created_id = "ben"
    @result_history.updated_id = "ben"
    @result_history.save

    # resultHistoryを新規作成する
    @m_test_type.testSize.times do |i|
        @result_his_detail = ResultHisDetail.new
        @result_his_detail.testHistId = @result_history.id
        @result_his_detail.testSeq = i+1
        case @m_test_type.testEnNm
        when '10multi'
            @result_his_detail = m_type_kakezan(@result_his_detail)
        when '10add'
            @result_his_detail = m_type_hikizan(@result_his_detail)
        when '10sub'
            @result_his_detail = m_type_genzan(@result_his_detail)
        when 'add2'
            @result_his_detail = m_type_hikizan2(@result_his_detail)
        when 'add3'
            @result_his_detail = m_type_hikizan3(@result_his_detail)
        when 'sub2'
            @result_his_detail = m_type_genzan2(@result_his_detail)
        when 'sub3'
            @result_his_detail = m_type_genzan3(@result_his_detail)
        end
        @result_his_detail.save        
    end
    
    redirect_to "/result_historys/showTest/"+@result_history.id.to_s      
  end
    
  def showHistList      
      userId = session[:user_id]

      @result_historys = ResultHistory.select("created_at,max(testResultFirst) as testResultFirst,min(testResultFirst) as testResultLast").where("testResultFirst not ? and userId = ?",nil,userId).group("strftime('%Y%m%d',created_at)").order("created_at desc");
  end
  
  def showHistDetailList      
      userId = session[:user_id]
      dateStr = params[:dateStr]
      @result_historys = ResultHistory.joins(:m_test_type).where("strftime('%Y%m%d',testStartTime) = ? and userId = ? and testResultFirst not ?",dateStr,userId,nil).order("testStartTime desc");
  end

  def showTestFirstHist      
      testHistId = params[:result_history_id]
      @result_history = ResultHistory.find(testHistId)
      @m_test_type = MTestType.find(@result_history.testTypeId)
      @result_his_details = ResultHisDetail.where(:testHistId => testHistId)
  end

    
  def showTest
      testHistId = params[:result_history_id]
      @result_history = ResultHistory.find(testHistId)
      @m_test_type = MTestType.find(@result_history.testTypeId)
      @result_his_details = ResultHisDetail.where(:testHistId => testHistId)
  end
    
  def calcTest
     # テスト結果詳細を更新する
     for param_result_his_detail in params[:result_his_details]
        @result_his_detail = ResultHisDetail.find(param_result_his_detail["id"])
        if @result_his_detail.testFirstAnswer.blank?
            @result_his_detail.testFirstAnswer = param_result_his_detail["test_answer"]
        end         
        @result_his_detail.testAnswer = param_result_his_detail["test_answer"] 
        if @result_his_detail.testAnswer == @result_his_detail.expectAnswer
            @result_his_detail.testResult = true 
        else
            @result_his_detail.testResult = false
        end
        @result_his_detail.save
     end
      
    # テスト結果を更新する
    testHistId = params[:result_history][:id]
    allCount = ResultHisDetail.where(testHistId: testHistId).count()
    correctCount = ResultHisDetail.where(testHistId: testHistId,testResult: 't').count()
    testResult = Integer(Float(correctCount)/allCount*100)
    @result_history = ResultHistory.find(testHistId)      
    if @result_history.testResultFirst.blank?
        testPoint = calcPoint(session[:user_id],@result_history.testTypeId,testResult)
        @result_history.testResultFirst = testResult
        @result_history.testPoint = testPoint
    end
    @result_history.testResultLast = testResult
    @result_history.testEndTime = Time.now
    @result_history.save

    @result_his_details = ResultHisDetail.where(testHistId: testHistId)
    redirect_to "/result_historys/showTestHis/"+@result_history.id.to_s+"/"+testPoint.to_s
  end

  def showTestHis
      testHistId = params[:result_history_id]
      @testPoint = params[:point]
      @result_history = ResultHistory.find(testHistId)
      @m_test_type = MTestType.find(@result_history.testTypeId)
      @result_his_details = ResultHisDetail.where(:testHistId => testHistId)
  end
    
  private    
    def m_type_kakezan(result_his_detail)
        sameQuestionSize = -1
        until sameQuestionSize == 0 do
            num1 = (rand(9)+1)
            num2 = (rand(9)+1)
            question = num1.to_s + " * " + num2.to_s
            expectAnswer = num1 * num2
            sameQuestionSize = ResultHisDetail.where(:testHistId => result_his_detail.testHistId,:testQuestion  => question).count()
        end
        result_his_detail.testQuestion = question
        result_his_detail.expectAnswer = expectAnswer      
        
        return result_his_detail
    end

    def m_type_hikizan(result_his_detail)
        sameQuestionSize = -1
        until sameQuestionSize == 0 do        
            num1 = (rand(9)+1)
            num2 = (rand(9)+1)
            question = num1.to_s + " + " + num2.to_s
            expectAnswer = num1 + num2
            sameQuestionSize = ResultHisDetail.where(:testHistId => result_his_detail.testHistId,:testQuestion  => question).count()
        end            
        result_his_detail.testQuestion = question
        result_his_detail.expectAnswer = expectAnswer

        return result_his_detail
    end

    def m_type_hikizan2(result_his_detail)
        sameQuestionSize = -1
        until sameQuestionSize == 0 do        
            num1 = (rand(99)+1)
            num2 = (rand(9)+1)
            question = num1.to_s + " + " + num2.to_s
            expectAnswer = num1 + num2
            sameQuestionSize = ResultHisDetail.where(:testHistId => result_his_detail.testHistId,:testQuestion  => question).count()
        end            
        result_his_detail.testQuestion = question
        result_his_detail.expectAnswer = expectAnswer

        return result_his_detail
    end

    def m_type_hikizan3(result_his_detail)
        sameQuestionSize = -1
        until sameQuestionSize == 0 do        
            num1 = (rand(99)+1)
            num2 = (rand(99)+1)
            question = num1.to_s + " + " + num2.to_s
            expectAnswer = num1 + num2
            sameQuestionSize = ResultHisDetail.where(:testHistId => result_his_detail.testHistId,:testQuestion  => question).count()
        end            
        result_his_detail.testQuestion = question
        result_his_detail.expectAnswer = expectAnswer

        return result_his_detail
    end

    
    
    def m_type_genzan(result_his_detail)
        sameQuestionSize = -1
        until sameQuestionSize == 0 do        
            num1 = (rand(9)+1)
            num2 = (rand(9)+1)    
            if (num1 < num2)
                num3 = num1
                num1 = num2
                num2 = num3
            end
            question = num1.to_s + " - " + num2.to_s
            expectAnswer = num1 - num2
            sameQuestionSize = ResultHisDetail.where(:testHistId => result_his_detail.testHistId,:testQuestion  => question).count()
        end
        result_his_detail.testQuestion = question
        result_his_detail.expectAnswer = expectAnswer
        
        return result_his_detail        
    end

    def m_type_genzan2(result_his_detail)
        sameQuestionSize = -1
        until sameQuestionSize == 0 do        
            num1 = (rand(99)+1)
            num2 = (rand(9)+1)    
            question = num1.to_s + " - " + num2.to_s
            expectAnswer = num1 - num2
            sameQuestionSize = ResultHisDetail.where(:testHistId => result_his_detail.testHistId,:testQuestion  => question).count()
        end
        result_his_detail.testQuestion = question
        result_his_detail.expectAnswer = expectAnswer
        
        return result_his_detail        
    end

    def m_type_genzan3(result_his_detail)
        sameQuestionSize = -1
        until sameQuestionSize == 0 do        
            num1 = (rand(99)+1)
            num2 = (rand(99)+1)    
            if (num1 < num2)
                num3 = num1
                num1 = num2
                num2 = num3
            end
            question = num1.to_s + " - " + num2.to_s
            expectAnswer = num1 - num2
            sameQuestionSize = ResultHisDetail.where(:testHistId => result_his_detail.testHistId,:testQuestion  => question).count()
        end
        result_his_detail.testQuestion = question
        result_his_detail.expectAnswer = expectAnswer
        
        return result_his_detail        
    end

    
    def calcPoint(userId,testTypeId,testResultFirst)
        # 該当するテストルールを取得する
        testRule = TestRule.find_by(:ruleUserId => userId,:mTestTypeId => testTypeId)
        testPoint = 0
       # puts testRule.maxScore
        # テストルールがある場合、ポイントの計算を行います
        if testRule.nil? == false
            #  テスト結果により、最大、中、最小ポイントを計算します
            if testRule.maxScore <= testResultFirst then
                testPoint = testRule.maxPoint
            elsif testRule.midScore <= testResultFirst then
                testPoint = testRule.midPoint
            elsif testRule.minScore <= testResultFirst then
                testPoint = testRule.minPoint
            end
            # ポイントがある場合、テスト回数を比較します。
            if testPoint != 0
                todayCount = ResultHistory.where("strftime('%Y%m%d',created_at) = strftime('%Y%m%d',current_date) and userId = ? and  testResultFirst not ? and testTypeId = ?",userId,nil,testTypeId).count()
                # 1日最大回数を超えた場合は、ポイントはリセットする
                if todayCount >= testRule.testCount
                    testPoint = 0
                end
            end
        end
        # 
        if testPoint != 0
            user = User.find(userId)
            if user.point.nil?
                user.point = testPoint
            else
                user.point = user.point + testPoint
            end
            user.save
        end
        return testPoint
    end
    
end