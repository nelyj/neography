require 'spec_helper'

module Neography
  class Rest
    describe NodeTraversal do

      let(:connection) { stub }
      subject { NodeTraversal.new(connection) }

      it "traverses" do
        description = {
          "order"           => :breadth,
          "uniqueness"      => :nodeglobal,
          "relationships"   => "relationships",
          "prune evaluator" => "prune_evaluator",
          "return filter"   => "return_filter",
          "depth"           => 4
        }

        expected_body = {
          "order"           => "breadth first",
          "uniqueness"      => "node global",
          "relationships"   => "relationships",
          "prune_evaluator" => "prune_evaluator",
          "return_filter"   => "return_filter",
          "max_depth"       => 4
        }

        connection.should_receive(:post).with("/node/42/traverse/relationship", json_match(:body, expected_body))

        subject.traverse("42", :relationship, description)
      end

    end
  end
end
